cmake_minimum_required(VERSION 3.10)
file(GLOB HEADERS "include/eosio/account_plugin/*.hpp")
file(GLOB HEADERS2 "include/eosio/account_plugin/*.h")

set(SRC_FILE account_plugin.cpp
             account_manager.cpp
             account.cpp
             cfg.cpp
             main.cpp
             http.cpp
             ${HEADERS}
             ${HEADERS2})
add_library( account_plugin ${SRC_FILE} )

target_link_libraries( account_plugin fc eosio_chain chain_plugin appbase ${Boost_LIBRARIES} ${rt_library})
target_include_directories( account_plugin PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/include" )
