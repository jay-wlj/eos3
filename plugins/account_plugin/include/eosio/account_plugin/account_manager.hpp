/**
 *  @file
 *  @copyright defined in eos/LICENSE.txt
 */
#pragma once
#include <eosio/chain/transaction.hpp>
#include "model.hpp"

namespace fc { class variant; }

namespace eosio {
namespace account {

/// Provides associate of wallet name to wallet and manages the interaction with each wallet.
///
/// The name of the wallet is also used as part of the file name by wallet_api. See account_manager::create.
/// No const methods because timeout may cause lock_all() to be called.
class account_manager {
public:
   account_manager() = default;
   account_manager(const account_manager&) = delete;
   account_manager(account_manager&&) = delete;
   account_manager& operator=(const account_manager&) = delete;
   account_manager& operator=(account_manager&&) = delete;
   ~account_manager() = default;

   /// Create a new wallet.
   /// A new wallet is created in file dir/{name}.wallet see set_dir.
   /// The new wallet is unlocked after creation.
   /// @param name of the wallet and name of the file without ext .wallet.
   /// @return Plaintext password that is needed to unlock wallet. Caller is responsible for saving password otherwise
   ///         they will not be able to unlock their wallet. Note user supplied passwords are not supported.
   /// @throws fc::exception if wallet with name already exists (or filename already exists)

    fc::variant create(const eosio::account::account_create& args);

    fc::mutable_variant_object createkey(const int& num);



    // get account balance
    fc::variant get_account_balance(const currency_balance& args);

    // transfer
    fc::variant transfer(const transfer_info& args);


private:

   std::string eosio_key = "5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3";


};

} // namespace wallet
} // namespace eosio


