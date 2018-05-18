#include <eosio/account_plugin/account.h>
#include <eosio/account_plugin/main.hpp>
#include <iostream>


int CreateAccount(const char* pCreator, const char* pNewAccount, const char* pOwnerkey, const char* pActiveKey){
    public_key_type owner_key, active_key;
    string active_key_str(pActiveKey);
    string owner_key_str(pOwnerkey);
      try {
         owner_key = public_key_type(owner_key_str);
      } EOS_RETHROW_EXCEPTIONS(public_key_type_exception, "Invalid owner public key: ${public_key}", ("public_key", owner_key_str))
      try {
         active_key = public_key_type(active_key_str);
      } EOS_RETHROW_EXCEPTIONS(public_key_type_exception, "Invalid active public key: ${public_key}", ("public_key", active_key_str))
      send_actions({create_newaccount(name(pCreator), name(pNewAccount), owner_key, active_key)});
    return 0;
}