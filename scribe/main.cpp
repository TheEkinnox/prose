#include "lexer/lexer.h"

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

    for (const std::string& path : paths)
    {
        std::cout << "Tokenizing '" << path << "'..." << std::endl;
        {
            ProfileScope("Tokenization");
            const std::string source = ReadFile(path);
            Tokenize(source, tokens);
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
#endif
    }

    return 0;
}
