file(GLOB HEADERS "include/eosio/account_api_plugin/*.hpp")
add_library( account_api_plugin
             account_api_plugin.cpp
             ${HEADERS} )

target_link_libraries( account_api_plugin account_plugin http_plugin appbase )
target_include_directories( account_api_plugin PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/include" )
