#pragma once

#include <string>
#include <string_view>
#include <vector>

void CmdLine_Init(int argc, char* argv[]);
const std::string& CmdLine_GetModuleName();
const std::string& CmdLine_GetAnonymous();
const std::vector<std::string>& CmdLine_GetAnonymousList();
const std::string& CmdLine_GetArg(std::string_view argName);