#pragma once
#include <fc/reflect/reflect.hpp>
#include <fc/string.hpp>

namespace fc { class variant; }
using namespace fc;

namespace eosio {
    namespace wallet {


    struct keypair {
        string public_key;
        string private_key;
        int key_type;
    };
    struct keypairs {
        vector<keypair> keys;
    };
  }
}
using namespace fc;

FC_REFLECT( eosio::wallet::keypair, (public_key)(private_key)(key_type))
FC_REFLECT(eosio::wallet::keypairs, (keys))

