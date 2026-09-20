#pragma once

#include <string>
#include <string_view>
#include <vector>

using AnonymousArgs = std::vector<std::string>;

void CmdLine_Init(int argc, char* argv[]);

std::string_view CmdLine_GetModuleName();
std::string_view CmdLine_GetAnonymous();
const AnonymousArgs& CmdLine_GetAnonymousList();

bool CmdLine_HasArg(std::string_view argName);
std::string_view CmdLine_GetArg(std::string_view argName);
