/**
 *  @file
 *  @copyright defined in eos/LICENSE.txt
 */
#include <eosio/wallet_plugin/wallet_manager.hpp>
#include <eosio/chain/exceptions.hpp>
#include <eosio/wallet_plugin/httpc.hpp>
#include <fc/io/json.hpp>
#include <eosio/wallet_plugin/model.hpp>
#include "../http_plugin/include/eosio/http_plugin/http_plugin.hpp"
#include <eosio/chain/types.hpp>


namespace eosio {
namespace wallet {

constexpr auto file_ext = ".wallet";
constexpr auto password_prefix = "PW";

static const string host = "localhost";
static const uint32_t port = 8080;
using namespace eosio::client::http;
using namespace fc;

template<typename T>
    fc::variant call(const string& path, const T& v){
        return eosio::client::http::call(host, port, path, fc::variant(v));
    }

std::string gen_password() {
   auto key = private_key_type::generate();
   return password_prefix + string(key);

}

void wallet_manager::set_timeout(const std::chrono::seconds& t) {
   timeout = t;
   timeout_time = std::chrono::system_clock::now() + timeout;
}

void wallet_manager::check_timeout() {
   if (timeout_time != timepoint_t::max()) {
      const auto& now = std::chrono::system_clock::now();
      if (now >= timeout_time + timeout) {
         lock_all();
      }
      timeout_time = now + timeout;
   }
}

std::string wallet_manager::create(const std::string& name) {
   check_timeout();
   std::string password = gen_password();

   auto wallet_filename = dir / (name + file_ext);

   if (fc::exists(wallet_filename)) {
      EOS_THROW(chain::wallet_exist_exception, "Wallet with name: '${n}' already exists at ${path}", ("n", name)("path",fc::path(wallet_filename)));
   }
   
   wallet_data d;
   auto wallet = make_unique<wallet_api>(d);
   wallet->set_password(password);
   wallet->set_wallet_filename(wallet_filename.string());
   wallet->unlock(password);
   wallet->import_key(eosio_key);
   wallet->lock();
   wallet->unlock(password);
   
   // If we have name in our map then remove it since we want the emplace below to replace.
   // This can happen if the wallet file is removed while eos-walletd is running.
   auto it = wallets.find(name);
   if (it != wallets.end()) {
      wallets.erase(it);
   }
   wallets.emplace(name, std::move(wallet));

   return password;
}

void wallet_manager::open(const std::string& name) {
   check_timeout();
   wallet_data d;
   auto wallet = std::make_unique<wallet_api>(d);
   auto wallet_filename = dir / (name + file_ext);
   wallet->set_wallet_filename(wallet_filename.string());
   if (!wallet->load_wallet_file()) {
      EOS_THROW(chain::wallet_nonexistent_exception, "Unable to open file: ${f}", ("f", wallet_filename.string()));
   }

   // If we have name in our map then remove it since we want the emplace below to replace.
   // This can happen if the wallet file is added while eos-walletd is running.
   auto it = wallets.find(name);
   if (it != wallets.end()) {
      wallets.erase(it);
   }
   wallets.emplace(name, std::move(wallet));
}

std::vector<std::string> wallet_manager::list_wallets() {
   check_timeout();
   std::vector<std::string> result;
   for (const auto& i : wallets) {
      if (i.second->is_locked()) {
         result.emplace_back(i.first);
      } else {
         result.emplace_back(i.first + " *");
      }
   }
   return result;
}

map<public_key_type,private_key_type> wallet_manager::list_keys() {
   check_timeout();
   map<public_key_type,private_key_type> result;
   for (const auto& i : wallets) {
      if (!i.second->is_locked()) {
         const auto& keys = i.second->list_keys();
         for (const auto& i : keys) {
            result[i.first] = i.second;
         }
      }
   }
   return result;
}

flat_set<public_key_type> wallet_manager::get_public_keys() {
   check_timeout();
   flat_set<public_key_type> result;
   for (const auto& i : wallets) {
      if (!i.second->is_locked()) {
         const auto& keys = i.second->list_keys();
         for (const auto& i : keys) {
            result.emplace(i.first);
         }
      }
   }
   if (!result.size()){
       // get publickeys from walletsrv
       fc::variant args;
        auto ret = call(wallet_get_public_keys, args);
        ok_results res = ret.as<ok_results>();
        if (res.ok){
            result = res.data.as<flat_set<public_key_type> >();
            //std::cout<<"result:"<<fc::json::to_string(result)<<std::endl;
            // if (res.data.is_array()){
            //     for (int i=0; i<res.data.size(); i++)
            //     {
            //         result.emplace(res.data[i]);
            //     }               
            // }    
        }
   }
   return result;
}


void wallet_manager::lock_all() {
   // no call to check_timeout since we are locking all anyway
   for (auto& i : wallets) {
      if (!i.second->is_locked()) {
         i.second->lock();
      }
   }
}

void wallet_manager::lock(const std::string& name) {
   check_timeout();
   if (wallets.count(name) == 0) {
      EOS_THROW(chain::wallet_nonexistent_exception, "Wallet not found: ${w}", ("w", name));
   }
   auto& w = wallets.at(name);
   if (w->is_locked()) {
      return;
   }
   w->lock();
}

void wallet_manager::unlock(const std::string& name, const std::string& password) {
   check_timeout();
   if (wallets.count(name) == 0) {
      open( name );
   }
   auto& w = wallets.at(name);
   if (!w->is_locked()) {
      return;
   }
   w->unlock(password);
}

void wallet_manager::import_key(const std::string& name, const std::string& wif_key) {
   check_timeout();
   if (wallets.count(name) == 0) {
      EOS_THROW(chain::wallet_nonexistent_exception, "Wallet not found: ${w}", ("w", name));
   }
   auto& w = wallets.at(name);
   if (w->is_locked()) {
      EOS_THROW(chain::wallet_locked_exception, "Wallet is locked: ${w}", ("w", name));
   }
   w->import_key(wif_key);
}




chain::signed_transaction
wallet_manager::sign_transaction(const chain::signed_transaction& txn, const flat_set<public_key_type>& keys, const chain::chain_id_type& id) {
   check_timeout();
   chain::signed_transaction stxn(txn);

   for (const auto& pk : keys) {
      bool found = false;
      for (const auto& i : wallets) {
         if (!i.second->is_locked()) {
            const auto& k = i.second->try_get_private_key(pk);
            if (k) {
               stxn.sign(*k, id);
               found = true;
               break; // inner for
            }
         }
      }
      // get private key from wallet srv

    auto ret = call(wallet_get_private_keys, keys);
    ok_results res = ret.as<ok_results>();
    if (res.ok){
        auto  keys = res.data.as<keypairs >().keys;
        for (int i=0; i<keys.size(); i++)
        {
            //std::cout<<"key:"<<keys[i].private_key<<endl;
            auto k = fc::crypto::private_key(keys[i].private_key);
            stxn.sign(k, id);
            found = true;
            break;
        }     
    }
    // variant_object obj = ret.get_object();
    // if (obj["ok"].is_bool() && obj["ok"].as_bool())
    // {
    //     if (obj.has("data") && obj["data"].is_array())
    //     {   
    //         fc:variants keys = obj["data"].get_array()
    //         for (int i=0; i<keys.size(); i++)
    //         {
    //             auto &key = keys[i].get_object();
    //             if (key.has("private_key") && key["private_key"].is_string())
    //             {
    //                 string str_key = key["private_key"].as_string();
    //                 private_key_type key = private_key(str_key);
    //                 stxn.sign(*k, id);
    //                 found = true;
    //                 break;
    //             }
    //         }
    //     }
        
    // }
    eosio::ok_results okRes = ret.as<eosio::ok_results>();
    std::cout<<"sign_transaction found "<<found<<endl;

    //   if (!found) {
    //      EOS_THROW(chain::wallet_missing_pub_key_exception, "Public key not found in unlocked wallets ${k}", ("k", pk));
    //   }
   }

   return stxn;
}

} // namespace wallet
} // namespace eosio
