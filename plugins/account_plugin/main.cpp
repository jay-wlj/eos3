
#include <eosio/account_plugin/main.hpp>
#include "../http_plugin/include/eosio/http_plugin/http_plugin.hpp"


FC_DECLARE_EXCEPTION( explained_exception, 9000000, "explained exception, see error log" );
FC_DECLARE_EXCEPTION( localized_exception, 10000000, "an error occured" );
#define EOSC_ASSERT( TEST, ... ) \
  FC_EXPAND_MACRO( \
    FC_MULTILINE_MACRO_BEGIN \
      if( UNLIKELY(!(TEST)) ) \
      {                                                   \
        std::cerr << localized( __VA_ARGS__ ) << std::endl;  \
        FC_THROW_EXCEPTION( explained_exception, #TEST ); \
      }                                                   \
    FC_MULTILINE_MACRO_END \
  )

string program = "eosc";
string host = "localhost";
uint32_t port = 8888;

// restricting use of wallet to localhost
string wallet_host = "localhost";
uint32_t wallet_port = 8888;

// string cfg.walletsrv_host = "localhost";
// uint32_t cfg.walletsrv_port = 8080;

auto   tx_expiration = fc::seconds(30);
bool   tx_force_unique = false;
bool   tx_dont_broadcast = false;
bool   tx_skip_sign = false;
bool   tx_print_json = false;

uint32_t tx_max_cpu_usage = 0;
uint32_t tx_max_net_usage = 0;

vector<string> tx_permission;
flat_set<public_key_type> public_keys;

string generate_nonce_value() {
   return fc::to_string(fc::time_point::now().time_since_epoch().count());
}

chain::action generate_nonce() {
   auto v = generate_nonce_value();
   variant nonce = fc::mutable_variant_object()
         ("value", v);
   return chain::action( {}, config::system_account_name, "nonce", fc::raw::pack(nonce));
}

vector<chain::permission_level> get_account_permissions(const vector<string>& permissions) {
   auto fixedPermissions = permissions | boost::adaptors::transformed([](const string& p) {
      vector<string> pieces;
      split(pieces, p, boost::algorithm::is_any_of("@"));
      if( pieces.size() == 1 ) pieces.push_back( "active" );
      return chain::permission_level{ .actor = pieces[0], .permission = pieces[1] };
   });
   vector<chain::permission_level> accountPermissions;
   boost::range::copy(fixedPermissions, back_inserter(accountPermissions));
   return accountPermissions;
}

template<typename T>
fc::variant call( const std::string& server, uint16_t port,
                  const std::string& path,
                  const T& v ) { return eosio::client::http::call( server, port, path, fc::variant(v) ); }

template<typename T>
fc::variant call( const std::string& path,
                  const T& v ) { return eosio::client::http::call( host, port, path, fc::variant(v) ); }

eosio::chain_apis::read_only::get_info_results get_info() {
  return call(host, port, get_info_func ).as<eosio::chain_apis::read_only::get_info_results>();
}

void get_account_permission(const signed_transaction& trx, vector<account_permission>& vps){
  auto &actions = trx.actions;
  for (auto &v : actions){
    for (auto &p : v.authorization){
      vps.emplace_back(account_permission{p.actor.to_string(), p.permission.to_string()});
    }
  }
}
fc::variant determine_required_keys(const signed_transaction& trx) {
   // TODO better error checking
   vector<account_permission> vps;
   get_account_permission(trx, vps);
   //const auto& public_keys = call(wallet_host, wallet_port, wallet_public_keys, vps);
  fc::variants public_keys;
  const auto &result = call(cfg.walletsrv_host, cfg.walletsrv_port, walletsrv_public_keys, vps);
  ok_results ret;
  result.as(ret);
  if (ret.ok){ 
    if (ret.data.is_array()){
      public_keys = ret.data.get_array();
    }
  }
   auto get_arg = fc::mutable_variant_object
           ("transaction", (transaction)trx)
           ("available_keys", public_keys);
   const auto& required_keys = call(host, port, get_required_keys, get_arg);
   return required_keys["required_keys"];
}

void sign_transaction(signed_transaction& trx, fc::variant& required_keys) {
   // TODO determine chain id
   fc::variants sign_args = {fc::variant(trx), required_keys, fc::variant(chain_id_type{})};
   const auto& signed_trx = call(wallet_host, wallet_port, wallet_sign_trx, sign_args);
   trx = signed_trx.as<signed_transaction>();
}

fc::variant push_transaction( signed_transaction& trx, int32_t extra_kcpu = 1000, packed_transaction::compression_type compression = packed_transaction::none ) {
   auto info = get_info();
   trx.expiration = info.head_block_time + tx_expiration;
   trx.set_reference_block(info.head_block_id);

   if (tx_force_unique) {
      trx.context_free_actions.emplace_back( generate_nonce() );
   }

   auto required_keys = determine_required_keys(trx);
   size_t num_keys = required_keys.is_array() ? required_keys.get_array().size() : 1;

   trx.max_kcpu_usage = (tx_max_cpu_usage + 1023)/1024;
   trx.max_net_usage_words = (tx_max_net_usage + 7)/8;

   if (!tx_skip_sign) {
      sign_transaction(trx, required_keys);
   }
  
  if (!tx_dont_broadcast) {
      return call(push_txn_func, packed_transaction(trx, compression));
   } else {
      return fc::variant(trx);
   }
}

fc::variant push_actions(std::vector<chain::action>&& actions, int32_t extra_kcpu, packed_transaction::compression_type compression = packed_transaction::none ) {
   signed_transaction trx;
   trx.actions = std::forward<decltype(actions)>(actions);
   return push_transaction(trx, extra_kcpu, compression);
}


void print_result( const fc::variant& result ) {
      const auto& processed = result["processed"];
      const auto& transaction_id = processed["id"].as_string();
      const auto& status = processed["status"].as_string() ;
      auto net = processed["net_usage"].as_int64();
      auto cpu = processed["cpu_usage"].as_int64();

      cout << status << " transaction: " << transaction_id << "  " << net << " bytes  " << cpu << " cycles\n";

      const auto& actions = processed["action_traces"].get_array();
      for( const auto& at : actions ) {
         auto receiver = at["receiver"].as_string();
         const auto& act = at["act"].get_object();
         auto code = act["account"].as_string();
         auto func = act["name"].as_string();
         auto args = fc::json::to_string( act["data"] );
         auto console = at["console"].as_string();

         /*
         if( code == "eosio" && func == "setcode" )
            args = args.substr(40)+"...";
         if( name(code) == config::system_account_name && func == "setabi" )
            args = args.substr(40)+"...";
         */
         if( args.size() > 100 ) args = args.substr(0,100) + "...";

         cout << "#" << std::setw(14) << right << receiver << " <= " << std::setw(28) << std::left << (code +"::" + func) << " " << args << "\n";
         if( console.size() ) {
            std::stringstream ss(console);
            string line;
            std::getline( ss, line );
            cout << ">> " << line << "\n";
         }
      }
}

void add_options(const account::options& ops)
{
  if (ops.permissions.size()){
    tx_permission = ops.permissions;
  }
  if (ops.public_keys.size()){
    public_keys.clear();
    for (auto &v : ops.public_keys){
      public_keys.insert(public_key_type(v));
    }
  }

  //std::cout<<"public_keys:"<<fc::json::to_string(ops.public_keys)<<std::endl;
}


using std::cout;
fc::variant send_actions(std::vector<chain::action>&& actions, int32_t extra_kcpu, packed_transaction::compression_type compression ) {
  //std::cout<<"actions:"<<fc::json::to_string(actions)<<endl;
   auto result = push_actions( std::move(actions), extra_kcpu, compression);

   if( tx_print_json ) {
      cout << fc::json::to_pretty_string( result );
   } else {
      print_result( result );
   }
   return result;
}

void send_transaction( signed_transaction& trx, int32_t extra_kcpu, packed_transaction::compression_type compression = packed_transaction::none  ) {
  
   auto result = push_transaction(trx, extra_kcpu, compression);
   if( tx_print_json ) {
      cout << fc::json::to_pretty_string( result );
   } else {
      auto trace = result["processed"].as<eosio::chain::transaction_trace>();
      print_result( result );
   }
}

chain::action create_newaccount(const name& creator, const name& newaccount, public_key_type owner, public_key_type active) {
    return action {
     
      tx_permission.empty() ? vector<chain::permission_level>{{creator,config::active_name}} : get_account_permissions(tx_permission),
      contracts::newaccount{
         .creator      = creator,
         .name         = newaccount,
         .owner        = eosio::chain::authority{1, {{owner, 1}}, {}},
         .active       = eosio::chain::authority{1, {{active, 1}}, {}},
         .recovery     = eosio::chain::authority{1, {}, {{{creator, config::active_name}, 1}}}
      }
   };
}


fc::variant json_from_file_or_string(const string& file_or_str, fc::json::parse_type ptype = fc::json::legacy_parser)
{
   regex r("^[ \t]*[\{\[]");
   if ( !regex_search(file_or_str, r) &&  fc::is_regular_file(file_or_str) ) {
      return fc::json::from_file(file_or_str, ptype);
   } else {
      return fc::json::from_string(file_or_str, ptype);
   }
}

fc::variant get_acount_balances(const currency_balance& args){
  auto result = call(get_currency_balance_func, fc::mutable_variant_object("json", false)
    ("account", args.accountName)
    ("code", args.contract)
    ("symbol", args.symbol=="*" ? fc::variant(args.symbol) : fc::variant() )
  );

  std::cout<<"result:"<<fc::json::to_string(result)<<"\nsymbol"<<args.symbol<<std::endl;
  fc::mutable_variant_object v("balance", "");
  const auto& rows = result.get_array();
  // if (args.symbol.empty()) {
  //     for( const auto& r : rows ) {
  //       std::cout << r.as_string()
  //                 << std::endl;
  //     }
  // } else if ( rows.size() > 0 ){
  //     std::cout << rows[0].as_string()
  //               << std::endl;
  // }
  if (rows.size()>0){
    v["balance"] = rows[0];
  }
  return v;
}

fc::variant push_action(string contract, string action, string data){
       fc::variant action_args_var;
      try {
         action_args_var = json_from_file_or_string(data, fc::json::relaxed_parser);
      } EOS_RETHROW_EXCEPTIONS(action_type_exception, "Fail to parse action JSON data='${data}'", ("data",data))

      auto arg= fc::mutable_variant_object
                ("code", contract)
                ("action", action)
                ("args", action_args_var);
      auto result = call(json_to_bin_func, arg);

      auto accountPermissions = get_account_permissions(tx_permission);
      std::cout<<"tx_permission:"<<fc::json::to_string(tx_permission)<<std::endl;
      return send_actions({chain::action{accountPermissions, contract, action, result.get_object()["binargs"].as<bytes>()}});
}