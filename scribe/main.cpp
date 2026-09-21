#include "lexer/lexer.h"
#include "parser/parser.h"

#include "utility/cmdline.h"
#include "utility/file.h"
#include "utility/profiler.h"
#include "utility/strings.h"

#include <format>
#include <fstream>
#include <iostream>

static struct
{
    bool printTokens;
    bool exportTokens;
    bool exportAST;
} s_cachedArgs;

static void CacheCommonArgs()
{
    const bool isVerbose = CmdLine_HasArg("--verbose") || CmdLine_HasArg("-V");
    const bool lexerOutput = CmdLine_HasArg("--lexer-output") || CmdLine_HasArg("-L");
    s_cachedArgs.printTokens = (isVerbose || lexerOutput) && !CmdLine_HasArg("--no-lexer-output");
    s_cachedArgs.exportTokens = CmdLine_HasArg("--export-tokens") || CmdLine_HasArg("-T");
}

static void Lex(const std::string& path, std::string& source, std::vector<Token>& tokens)
{
    std::cout << "Tokenizing '" << path << "'..." << std::endl;
    {
        ProfileScope("Tokenization");
        source = ReadFile(path);
        Tokenize(source, tokens);
    }

    if (!s_cachedArgs.printTokens && !s_cachedArgs.exportTokens)
        return;

    {
        ProfileScope("Printing tokens");
        constexpr std::string_view FMT_TOKEN = "{:>4}:{:<4} | {:<16} | {}";
        const std::string header = std::format(FMT_TOKEN, "LINE", "COL", "TYPE", "VALUE");

        if (s_cachedArgs.printTokens)
            std::cout << header << std::endl;

        std::ofstream outputStream;
        if (s_cachedArgs.exportTokens)
        {
            outputStream.open(path + ".l", std::ios::out | std::ios::trunc);
            outputStream << header << std::endl;
        }

        for (const Token& token : tokens)
        {
            std::string sanitizedValue(token.value.begin(), token.value.end());
            ReplaceAll(sanitizedValue, "\r", "\\r");
            ReplaceAll(sanitizedValue, "\n", "\\n");
            ReplaceAll(sanitizedValue, "\t", "\\t");

            const std::string output = std::format(FMT_TOKEN, token.line, token.column, token.type._to_string(), sanitizedValue);
            if (s_cachedArgs.printTokens)
                std::cout << output << '\n';

            if (s_cachedArgs.exportTokens)
                outputStream << output << '\n';
        }
    }

    std::cout << std::endl;
}

int main(const int argc, char* argv[])
{
    ScopeProfiler profiler("Execution");

    CmdLine_Init(argc, argv);
    CacheCommonArgs();

    const AnonymousArgs& paths = CmdLine_GetAnonymousList();
    std::vector<Token> tokens;
    std::string source;

    for (const std::string& path : paths)
    {
        Lex(path, source, tokens);
    }

    return 0;
}
