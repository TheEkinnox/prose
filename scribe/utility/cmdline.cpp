#include "cmdline.h"

#include "macros.h"

#include <string>
#include <unordered_map>

#if defined(DEBUG)
#include <iostream>
#endif

using CmdLineMap = std::unordered_map<std::string_view, std::string>;

constexpr std::string_view CmdLine_Anonymous = "<anon>";
constexpr std::string_view CmdLine_ModuleName = "<module>";

static CmdLineMap& GetCmdLineMap()
{
    NO_DESTROY static CmdLineMap cmdLineMap;
    return cmdLineMap;
}

static AnonymousArgs& GetAnonymousArgs()
{
    NO_DESTROY static AnonymousArgs anonymousArgs;
    return anonymousArgs;
}

#if defined(DEBUG)
static void CmdLine_PrintArgs()
{
    std::cout << "= PARSED ARGS =\n";

    for (const auto& [key, value] : GetCmdLineMap())
    {
        if (value.empty())
            std::cout << key << "\n";
        else
            std::cout << key << " = '" << value << "'\n";
    }

    std::cout << std::endl;
}
#endif

static void CmdLine_SetValue(const std::string_view key, const std::string_view value)
{
    CmdLineMap& cmdLineMap = GetCmdLineMap();

    if (!key.empty())
        cmdLineMap[key] = value;
    else if (!value.empty())
        cmdLineMap[CmdLine_Anonymous] = value;
}

void CmdLine_Init(const int argc, char* argv[])
{
    CmdLineMap& cmdLineMap = GetCmdLineMap();
    AnonymousArgs& anonymousArgs = GetAnonymousArgs();

    cmdLineMap.clear();
    cmdLineMap.reserve(static_cast<size_t>(argc));

    if (argc == 0)
        return;

    cmdLineMap[CmdLine_ModuleName] = argv[0];

    std::string_view key;
    std::string value;

    for (int i = 1; i < argc; ++i)
    {
        std::string_view arg(argv[i]);

        if (arg.starts_with('-'))
        {
            CmdLine_SetValue(key, value);

            key = arg;
            value.clear();
            continue;
        }

        // TODO: Determine if we want to allow empty arguments
        // If we have one, chances are it's enclosed in quotes so it might be intentional...
        if (!arg.empty())
        {
            if (key.empty())
                anonymousArgs.emplace_back(arg.begin(), arg.end());

            if (!value.empty())
                value += ' ';

            if (arg.find(' ') != std::string::npos && arg.front() != '\"' && arg.back() != '\"')
            {
                value.reserve(value.size() + 2 + arg.size());
                value += '\"';
                value += arg;
                value += '\"';
            }
            else
                value += arg;
        }
    }

    CmdLine_SetValue(key, value);

#if defined(DEBUG)
    CmdLine_PrintArgs();
#endif
}

std::string_view CmdLine_GetModuleName()
{
    return CmdLine_GetArg(CmdLine_ModuleName);
}

std::string_view CmdLine_GetAnonymous()
{
    return CmdLine_GetArg(CmdLine_Anonymous);
}

const AnonymousArgs& CmdLine_GetAnonymousList()
{
    return GetAnonymousArgs();
}

bool CmdLine_HasArg(const std::string_view argName)
{
    return GetCmdLineMap().contains(argName);
}

std::string_view CmdLine_GetArg(const std::string_view argName)
{
    const CmdLineMap& cmdLineMap = GetCmdLineMap();

    if (cmdLineMap.empty())
        return {};

    const auto it = cmdLineMap.find(argName);
    return it != cmdLineMap.end() ? std::string_view(it->second) : std::string_view();
}
