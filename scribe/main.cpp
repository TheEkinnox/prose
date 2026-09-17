#include "lexer/lexer.h"

#include "utility/cmdline.h"
#include "utility/file.h"
#include "utility/strings.h"

#include <chrono>
#include <iostream>

int main(const int argc, char* argv[])
{
    CmdLine_Init(argc, argv);

    const AnonymousArgs& paths = CmdLine_GetAnonymousList();
    std::chrono::high_resolution_clock clock;
    const auto start = clock.now();
    for (const std::string& path : paths)
    {
        std::cout << "Tokenizing '" << path << "'..." << std::endl;
        const auto tokenizationStart = clock.now();
        const std::string source = ReadFile(path);
        const std::vector<Token> tokens = Tokenize(source);
        std::cout << "Done in " << std::chrono::duration_cast<std::chrono::microseconds>(clock.now() - tokenizationStart).count() << "us." << std::endl;

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

    std::cout << "Total time: " << std::chrono::duration_cast<std::chrono::milliseconds>(clock.now() - start).count() << "ms.\n";

    return 0;
}
