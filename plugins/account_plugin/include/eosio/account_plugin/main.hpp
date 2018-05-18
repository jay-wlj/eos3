#pragma once

#include <string>
#include <vector>
#include <regex>
#include <boost/asio.hpp>
#include <boost/format.hpp>
#include <iostream>
#include <fc/variant.hpp>
#include <fc/io/json.hpp>
#include <fc/io/console.hpp>
#include <fc/exception/exception.hpp>
#include <eosio/utilities/key_conversion.hpp>

#include <eosio/chain/config.hpp>
#include <eosio/chain/wast_to_wasm.hpp>
#include <eosio/chain/transaction_trace.hpp>
#include <eosio/chain_plugin/chain_plugin.hpp>

#include <boost/range/algorithm/find_if.hpp>
#include <boost/range/algorithm/sort.hpp>
#include <boost/range/adaptor/transformed.hpp>
#include <boost/algorithm/string/predicate.hpp>
#include <boost/algorithm/string/split.hpp>
#include <boost/range/algorithm/copy.hpp>
#include <boost/algorithm/string/classification.hpp>

#include <Inline/BasicTypes.h>
#include <IR/Module.h>
#include <IR/Validate.h>
#include <WAST/WAST.h>
#include <WASM/WASM.h>
#include <Runtime/Runtime.h>

#include <fc/io/fstream.hpp>

#include "CLI11.hpp"
//#include "help_text.hpp"
#include "localize.hpp"
//#include "config.hpp"
#include "http.hpp"
#include "model.hpp"
#include "cfg.h"


using namespace std;
using namespace eosio;
using namespace eosio::chain;
using namespace eosio::utilities;
//using namespace eosio::client::help;
using namespace eosio::client::http;
using namespace eosio::client::localize;
//using namespace eosio::client::config;
using namespace boost::filesystem;
using namespace eosio::account;
using namespace fc;




void add_options(const account::options& ops);

fc::variant send_actions(std::vector<chain::action>&& actions, int32_t extra_kcpu = 1000, packed_transaction::compression_type compression = packed_transaction::none );

chain::action create_newaccount(const name& creator, const name& newaccount, public_key_type owner, public_key_type active);

fc::variant get_acount_balances(const currency_balance& args);

fc::variant push_action(string contract, string action, string data);