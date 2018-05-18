/**
 *  @file
 *  @copyright defined in eos/LICENSE.txt
 */
#pragma once
#include <appbase/application.hpp>
#include <fc/variant.hpp>
#include <eosio/chain/contracts/types.hpp>
#include <eosio/chain/transaction.hpp>

namespace fc { class variant; }

namespace eosio {
   using namespace appbase;

   namespace account {
      class account_manager;
   }
   using namespace account;

class account_plugin : public plugin<account_plugin> {
public:
   APPBASE_PLUGIN_REQUIRES()

   account_plugin();
   account_plugin(const account_plugin&) = delete;
   account_plugin(account_plugin&&) = delete;
   account_plugin& operator=(const account_plugin&) = delete;
   account_plugin& operator=(account_plugin&&) = delete;
   virtual ~account_plugin() override = default;

   virtual void set_program_options(options_description& cli, options_description& cfg) override;
   void plugin_initialize(const variables_map& options);
   void plugin_startup() {}
   void plugin_shutdown() {}

   // api interface provider
   account_manager& get_account_plugin_mgr();

private:
   std::unique_ptr<account_manager> account_manager_mgr;
};

}

