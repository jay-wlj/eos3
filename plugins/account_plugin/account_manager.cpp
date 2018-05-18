#include <eosio/account_plugin/account_manager.hpp>
#include <eosio/account_plugin/main.hpp>

namespace eosio {
namespace account {

fc::variant account_manager::create(const eosio::account::account_create& args)
{
    add_options(args);
    public_key_type owner_key, active_key;


    try {
        owner_key = public_key_type(args.owner);
    } EOS_RETHROW_EXCEPTIONS(public_key_type_exception, "Invalid owner public key: ${public_key}", ("public_key", args.owner))
    try {
        active_key = public_key_type(args.active);  
    } EOS_RETHROW_EXCEPTIONS(public_key_type_exception, "Invalid active public key: ${public_key}", ("public_key", args.active))
 
    auto ret = send_actions({create_newaccount(args.creator, args.newaccount, owner_key, active_key)});

    return ret;
}

fc::mutable_variant_object account_manager::createkey(const int& num){
    fc::mutable_variant_object m;
    fc::variants rets;
    for (int i=0; i<num; i++){
        auto pk    = private_key_type::generate();
        auto privs = string(pk);
        auto pubs  = string(pk.get_public_key());

        fc::mutable_variant_object objs;
        objs["public_key"] = pubs;
        objs["private_key"] = privs;
        rets.emplace_back(objs);
    }
    m["keys"] = rets;
    return m;
}

fc::variant account_manager::get_account_balance(const currency_balance& args)
{
    //std::cout<<"account_manager::egin get_acount_balances"<<endl;
    return get_acount_balances(args);
}

fc::variant account_manager::transfer(const transfer_info& args)
{
    add_options(args);
    return push_action(args.contract, "transfer", args.data);
}


}
}