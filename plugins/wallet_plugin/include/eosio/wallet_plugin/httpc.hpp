/**
 *  @file
 *  @copyright defined in eos/LICENSE.txt
 */
#pragma once

using fc::string;
namespace eosio { namespace client { namespace http {
   fc::variant call( const std::string& server, uint16_t port,
                     const std::string& path,
                     const fc::variant& postdata = fc::variant() );

   const string wallet_func_base = "/v1/man/wallet";
   const string wallet_get_private_keys = wallet_func_base + "/get_private_keys";
    const string wallet_get_public_keys = wallet_func_base + "/get_public_keys";
 }}}