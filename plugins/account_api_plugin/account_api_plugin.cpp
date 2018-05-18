/**
 *  @file
 *  @copyright defined in eos/LICENSE.txt
 */
#include <eosio/account_api_plugin/account_api_plugin.hpp>
#include <eosio/account_plugin/account_manager.hpp>
#include <eosio/chain/exceptions.hpp>
#include <eosio/chain/transaction.hpp>
#include <eosio/account_plugin/model.hpp>
#include <fc/variant.hpp>
#include <fc/io/json.hpp>

#include <chrono>

namespace eosio { namespace detail {
  struct account_api_plugin_empty {};
}}

FC_REFLECT(eosio::detail::account_api_plugin_empty, );

namespace eosio {

static appbase::abstract_plugin& _account_api_plugin = app().register_plugin<account_api_plugin>();

using namespace eosio;

#define CALL(api_name, api_handle, call_name, INVOKE, http_response_code) \
{std::string("/v1/" #api_name "/" #call_name), \
   [&api_handle](string, string body, url_response_callback cb) mutable { \
          try { \
             if (body.empty()) body = "{}"; \
             std::cout<<"body: "<<body<<std::endl;\
             INVOKE \
             ok_results ret{http_response_code>=200&&http_response_code<300? true: false, http_response_code, "", "", result}; \
             cb(http_response_code, fc::json::to_string(ret)); \
          } catch (fc::eof_exception& e) { \
             error_results results{400, "Bad Request", e}; \
             cb(400, fc::json::to_string(results)); \
             elog("Unable to parse arguments: ${args}", ("args", body)); \
          } catch (fc::exception& e) { \
             error_results results{500, "Internet Service", e}; \
             cb(500, fc::json::to_string(results)); \
             elog("Exception encountered while processing ${call}: ${e}", ("call", #api_name "." #call_name)("e", e)); \
          } \
       }}

#define INVOKE_R_R(api_handle, call_name, in_param) \
     auto result = api_handle.call_name(fc::json::from_string(body).as<in_param>());

#define INVOKE_R_R_R_R(api_handle, call_name, in_param0, in_param1, in_param2) \
     const auto& vs = fc::json::json::from_string(body).as<fc::variants>(); \
     auto result = api_handle.call_name(vs.at(0).as<in_param0>(), vs.at(1).as<in_param1>(), vs.at(2).as<in_param2>());

#define INVOKE_R_V(api_handle, call_name) \
     auto result = api_handle.call_name();

#define INVOKE_V_R(api_handle, call_name, in_param) \
     api_handle.call_name(fc::json::from_string(body).as<in_param>()); \
     eosio::detail::account_api_plugin_empty result;

#define INVOKE_V_R_R(api_handle, call_name, in_param0, in_param1) \
     const auto& vs = fc::json::json::from_string(body).as<fc::variants>(); \
     api_handle.call_name(vs.at(0).as<in_param0>(), vs.at(1).as<in_param1>()); \
     eosio::detail::account_api_plugin_empty result;

#define INVOKE_V_V(api_handle, call_name) \
     api_handle.call_name(); \
     eosio::detail::account_api_plugin_empty result;


void account_api_plugin::plugin_startup() {
   ilog("starting account_api_plugin");
   // lifetime of plugin is lifetime of application
   auto& account_mgr = app().get_plugin<account_plugin>().get_account_plugin_mgr();

   app().get_plugin<http_plugin>().add_api({
       CALL(account, account_mgr, create,
            INVOKE_R_R(account_mgr, create, eosio::account::account_create), 200),
      CALL(account, account_mgr, createkey,
          INVOKE_R_R(account_mgr, createkey, int), 200),
      CALL(account, account_mgr, get_account_balance,
        INVOKE_R_R(account_mgr, get_account_balance, currency_balance), 200),
    CALL(account, account_mgr, transfer,
        INVOKE_R_R(account_mgr, transfer, transfer_info), 200),
    //    CALL(account, account_mgr, create,
    //         INVOKE_R_R(account_mgr, create, std::string), 201),
    //    CALL(account, account_mgr, open,
    //         INVOKE_V_R(account_mgr, open, std::string), 200),
    //    CALL(account, account_mgr, lock_all,
    //         INVOKE_V_V(account_mgr, lock_all), 200),
    //    CALL(account, account_mgr, lock,
    //         INVOKE_V_R(account_mgr, lock, std::string), 200),
    //    CALL(account, account_mgr, unlock,
    //         INVOKE_V_R_R(account_mgr, unlock, std::string, std::string), 200),
    //    CALL(account, account_mgr, import_key,
    //         INVOKE_V_R_R(account_mgr, import_key, std::string, std::string), 201),
    //    CALL(account, account_mgr, list_wallets,
    //         INVOKE_R_V(account_mgr, list_wallets), 200),
    //    CALL(account, account_mgr, list_keys,
    //         INVOKE_R_V(account_mgr, list_keys), 200),
    //    CALL(account, account_mgr, get_public_keys,
    //         INVOKE_R_V(account_mgr, get_public_keys), 200)
   });
}

void account_api_plugin::plugin_initialize(const variables_map& options) {
   if (options.count("http-server-address")) {
      const auto& lipstr = options.at("http-server-address").as<string>();
      const auto& host = lipstr.substr(0, lipstr.find(':'));
      if (host != "localhost" && host != "127.0.0.1") {
         wlog("\n"
              "*************************************\n"
              "*                                   *\n"
              "*  --   Wallet NOT on localhost  -- *\n"
              "*  - Password and/or Private Keys - *\n"
              "*  - are transferred unencrypted. - *\n"
              "*                                   *\n"
              "*************************************\n");
      }
   }
}


#undef INVOKE_R_R
#undef INVOKE_R_R_R_R
#undef INVOKE_R_V
#undef INVOKE_V_R
#undef INVOKE_V_R_R
#undef INVOKE_V_V
#undef CALL

}
