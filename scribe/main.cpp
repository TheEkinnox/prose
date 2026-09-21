#include "lexer/lexer.h"

#include "parser/declarations.h"
#include "parser/parser.h"

#include "utility/cmdline.h"
#include "utility/file.h"
#include "utility/profiler.h"
#include "utility/strings.h"

#include <cassert>
#include <format>
#include <fstream>
#include <iostream>

enum class CompileStep : uint8_t
{
    Lexer,
    Parser,
    All
};

static struct
{
    CompileStep highestStep;
    bool printTokens;
    bool exportTokens;
    bool printAST;
    bool exportAST;
} s_cachedArgs;

static CompileStep GetHighestCompileStep()
{
    CompileStep highestStep = CompileStep::All;

    if (CmdLine_HasArg("--lex") || CmdLine_HasArg("-l"))
        highestStep = CompileStep::Lexer;

    if (CmdLine_HasArg("--parse") || CmdLine_HasArg("-p"))
        highestStep = CompileStep::Parser;

    return highestStep;
}

static void CacheCommonArgs()
{
    s_cachedArgs.highestStep = GetHighestCompileStep();

    const bool isVerbose = CmdLine_HasArg("--verbose") || CmdLine_HasArg("-V");
    const bool lexerOutput = CmdLine_HasArg("--lexer-output") || CmdLine_HasArg("-L");
    s_cachedArgs.printTokens = (isVerbose || lexerOutput) && !CmdLine_HasArg("--no-lexer-output");
    s_cachedArgs.exportTokens = CmdLine_HasArg("--export-tokens") || CmdLine_HasArg("-T");

    const bool parserOutput = CmdLine_HasArg("--parser-output") || CmdLine_HasArg("-P");
    s_cachedArgs.printAST = (isVerbose || parserOutput) && !CmdLine_HasArg("--no-parser-output");
    s_cachedArgs.exportAST = CmdLine_HasArg("--export-ast") || CmdLine_HasArg("-A");
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

static bool Parse(const std::string& path, const std::vector<Token>& tokens, Program& out)
{
    std::cout << "Parsing '" << path << "'..." << std::endl;
    {
        ProfileScope("Parsing");
        if (!ParseProgram(tokens, out))
            return false;
    }

    if (!s_cachedArgs.printAST && !s_cachedArgs.exportAST)
        return true;

    std::ofstream outputStream;
    if (s_cachedArgs.exportAST)
        outputStream.open(path + ".p", std::ios::out | std::ios::trunc);

    {
        ProfileScope("Printing AST");
        if (s_cachedArgs.printAST)
            std::cout << out << std::endl;

        if (s_cachedArgs.exportAST)
            outputStream << out << std::endl;
    }

    std::cout << std::endl;

    return true;
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

        if (s_cachedArgs.highestStep < CompileStep::Parser)
            continue;

        Program program;
        Parse(path, tokens, program);
    }

    return 0;
}
