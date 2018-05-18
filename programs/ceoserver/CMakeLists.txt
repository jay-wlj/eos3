ADD_EXECUTABLE(ceoserver main.cpp)
if ( UNIX AND NOT APPLE)
    set(rt_libray rt)
endif()



find_package( Gperftools QUIET )
if( GPERFTOOLS_FOUND )
    message( STATUS "Found gperftools; compiling ceoserver with TCMalloc")
    list( APPEND PLATFORM_SPECIFIC_LIBS tcmalloc )
endif()


target_link_libraries( ceoserver
        PRIVATE appbase
        PRIVATE account_api_plugin 
        PRIVATE account_plugin
        PRIVATE http_plugin
        PRIVATE eosio_chain 
        PRIVATE chain_plugin fc ${CMAKE_DL_LIBS} ${PLATFORM_SPECIFIC_LIBS} )


install( TARGETS
   ceoserver

   RUNTIME DESTINATION ${CMAKE_INSTALL_FULL_BINDIR}
   LIBRARY DESTINATION ${CMAKE_INSTALL_FULL_LIBDIR}
   ARCHIVE DESTINATION ${CMAKE_INSTALL_FULL_LIBDIR}
)