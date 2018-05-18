#pragma once
#include <fc/reflect/reflect.hpp>
#include <fc/string.hpp>

namespace fc { class variant; }
using namespace fc;

namespace eosio {
    namespace account {

    struct options{
        std::vector<string> permissions;
        std::vector<string> public_keys;
    };

    struct account_create : options{
        string creator;
        string newaccount;
        string owner;
        string active;
    };

    struct currency_balance{
        string contract;
        string accountName;
        string symbol;
    };

    struct transfer_info : options{
        string contract;
        string data;
    };

    struct account_permission {
        string accountName;
        string permission;
    };
  }
}
using namespace fc;

FC_REFLECT( eosio::account::options, (permissions)(public_keys))
FC_REFLECT( eosio::account::currency_balance, (contract)(accountName)(symbol))
FC_REFLECT( eosio::account::account_permission, (accountName)(permission))


FC_REFLECT_DERIVED( eosio::account::transfer_info, (eosio::account::options), (contract)(data))
//FC_REFLECT( eosio::account::account_create, (options)(creator)(newaccount)(owner)(active) )
FC_REFLECT_DERIVED( eosio::account::account_create, (eosio::account::options), (creator)(newaccount)(owner)(active))

