#include "lexer/lexer.h"

#include "utility/cmdline.h"
#include "utility/file.h"
#include "utility/profiler.h"
#include "utility/strings.h"

#include <chrono>
#include <iostream>

int main(const int argc, char* argv[])
{
    ScopeProfiler profiler("Execution");

    CmdLine_Init(argc, argv);

    const AnonymousArgs& paths = CmdLine_GetAnonymousList();
    for (const std::string& path : paths)
    {
        std::string source;
        std::vector<Token> tokens;

        std::cout << "Tokenizing '" << path << "'..." << std::endl;
        {
            ProfileScope("Tokenization");
            source = ReadFile(path);
            tokens = Tokenize(source);
        }

#if defined(DEBUG)
        for (const Token& token : tokens)
        {
            std::string sanitizedString(token.value.begin(), token.value.end());
            ReplaceAll(sanitizedString, "\r", "\\r");
            ReplaceAll(sanitizedString, "\n", "\\n");
            ReplaceAll(sanitizedString, "\t", "\\t");
            std::cout << token.line << ':' << token.column << '\t' << token.type._to_string() << '(' << sanitizedString << ")\n";
        }

        std::cout << std::endl;
#else
        (void)tokens.empty();
#endif
    }

    return 0;
}
