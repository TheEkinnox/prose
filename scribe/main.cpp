#include "lexer/lexer.h"
#include "parser/parser.h"

#include "utility/cmdline.h"
#include "utility/file.h"
#include "utility/profiler.h"
#include "utility/strings.h"

#include <iostream>

int main(const int argc, char* argv[])
{
    ScopeProfiler profiler("Execution");

    CmdLine_Init(argc, argv);

    const AnonymousArgs& paths = CmdLine_GetAnonymousList();
    std::vector<Token> tokens;
    std::string source;
    std::vector<Program> programs;

    for (const std::string& path : paths)
    {
        std::cout << "Tokenizing '" << path << "'..." << std::endl;
        {
            ProfileScope("Tokenization");
            source = ReadFile(path);
            Tokenize(source, tokens);
        }

#if defined(DEBUG)
        {
            ProfileScope("Printing tokens");
            for (const Token& token : tokens)
            {
                std::string sanitizedString(token.value.begin(), token.value.end());
                ReplaceAll(sanitizedString, "\r", "\\r");
                ReplaceAll(sanitizedString, "\n", "\\n");
                ReplaceAll(sanitizedString, "\t", "\\t");
                std::cout << token.line << ':' << token.column << '\t' << token.type._to_string() << '(' << sanitizedString << ")\n";
            }
        }
        std::cout << std::endl;
#endif

        std::cout << "Parsing '" << path << "'..." << std::endl;
        {
            ProfileScope("Parsing");
            Program program;

            if (!ParseProgram(tokens, program))
            {
                std::cerr << "Failed to parse '" << path << "'\n";
                continue;
            }

            programs.emplace_back(std::move(program));
        }
    }

    return 0;
}
