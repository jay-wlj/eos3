#include <eosio/account_plugin/account_plugin.hpp>
#include <eosio/account_plugin/account_manager.hpp>
#include <appbase/application.hpp>
#include <eosio/account_plugin/cfg.h>

namespace eosio{


static appbase::abstract_plugin& _account_plugin = app().register_plugin<account_plugin>();

account_plugin::account_plugin()
  : account_manager_mgr(new account_manager()) {
}

void account_plugin::set_program_options(options_description& cli, options_description& cfg){
    cfg.add_options()
      ("walletsrv-address", bpo::value<string>()->default_value("127.0.0.1:8080"),
      "The server to get wallet keys.")
      ;
}

void account_plugin::plugin_initialize(const variables_map& options)
{
  if (options.count("walletsrv-address")){
    auto address = options.at("walletsrv-address").as<string>();
    auto host = address.substr(0, address.find(":"));
    auto port = address.substr(host.length()+1);
    cfg.walletsrv_host = host;
    cfg.walletsrv_port = std::stoi(port);
    std::cout<<"walletsrv_host:"<<cfg.walletsrv_host<<":"<<cfg.walletsrv_port<<endl;
  } 
}

account_manager& account_plugin::get_account_plugin_mgr() {
   return *account_manager_mgr;
}

}