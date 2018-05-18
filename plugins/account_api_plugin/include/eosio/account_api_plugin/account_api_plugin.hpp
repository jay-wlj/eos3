
#pragma once

#include <eosio/account_plugin/account_plugin.hpp>
#include <eosio/http_plugin/http_plugin.hpp>

#include <appbase/application.hpp>


namespace eosio {

using namespace appbase;


class account_api_plugin : public plugin<account_api_plugin> {
public:
   APPBASE_PLUGIN_REQUIRES((account_plugin) (http_plugin))

   account_api_plugin() = default;
   account_api_plugin(const account_api_plugin&) = delete;
   account_api_plugin(account_api_plugin&&) = delete;
   account_api_plugin& operator=(const account_api_plugin&) = delete;
   account_api_plugin& operator=(account_api_plugin&&) = delete;
   virtual ~account_api_plugin() override = default;

   virtual void set_program_options(options_description& cli, options_description& cfg) override {}
   void plugin_initialize(const variables_map& vm);
   void plugin_startup();
   void plugin_shutdown() {}

private:
};

}
