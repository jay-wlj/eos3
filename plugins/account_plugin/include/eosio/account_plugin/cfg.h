#pragma once
#include <string>
using namespace std;

class Config {
public:
    Config() = default;
    ~Config() = default;
    Config(const Config&) = delete;
    Config& operator=(const Config&) = delete;
public:
    string walletsrv_host = "localhost";
    unsigned short walletsrv_port = 8080;

};


extern Config cfg;