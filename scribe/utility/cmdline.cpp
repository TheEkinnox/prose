#include "cmdline.h"

#include <string>
#include <unordered_map>

#if defined(DEBUG)
#include <iostream>
#endif

static std::string s_emptyString{};
static std::unordered_map<std::string_view, std::string> s_cmdLine{};
static std::vector<std::string> s_anonymousArgs{};

constexpr std::string_view CmdLine_Anonymous = "<anon>";
constexpr std::string_view CmdLine_ModuleName = "<module>";

#if defined(DEBUG)
void CmdLine_PrintArgs()
{
    std::cout << "= PARSED ARGS =\n";

    for (const auto& [key, value] : s_cmdLine)
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
    if (!key.empty())
        s_cmdLine[key] = value;
    else if (!value.empty())
        s_cmdLine[CmdLine_Anonymous] = value;
}

void CmdLine_Init(const int argc, char* argv[])
{
    s_cmdLine.clear();
    s_cmdLine.reserve(argc);

    if (argc == 0)
        return;

    s_cmdLine[CmdLine_ModuleName] = argv[0];

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
                s_anonymousArgs.emplace_back(arg.begin(), arg.end());

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

const std::string& CmdLine_GetModuleName()
{
    return CmdLine_GetArg(CmdLine_ModuleName);
}

const std::string& CmdLine_GetAnonymous()
{
    return CmdLine_GetArg(CmdLine_Anonymous);
}

const std::vector<std::string>& CmdLine_GetAnonymousList()
{
    return s_anonymousArgs;
}

const std::string& CmdLine_GetArg(const std::string_view argName)
{
    if (s_cmdLine.empty())
        return s_emptyString;

    const auto it = s_cmdLine.find(argName);
    return it != s_cmdLine.end() ? it->second : s_emptyString;
}
