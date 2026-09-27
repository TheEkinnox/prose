#ifdef BUILD_TESTING
#include "lexer/lexer.h"
#include "parser/parser.h"

#include "utility/file.h"
#include "utility/macros.h"
#include "utility/strings.h"

#include <filesystem>

NO_WARNINGS_PUSH
#include <gtest/gtest.h>
NO_WARNINGS_POP

namespace
{
    class ParserTest : public ::testing::TestWithParam<std::filesystem::path>
    {
    };

    std::vector<std::filesystem::path> getTestFiles(const std::filesystem::path& testsRoot)
    {
        std::vector<std::filesystem::path> testFiles;

        assert(std::filesystem::exists(testsRoot));
        assert(std::filesystem::is_directory(testsRoot));

        const ptrdiff_t fileCount = std::distance(std::filesystem::directory_iterator(testsRoot), std::filesystem::directory_iterator());
        testFiles.reserve(static_cast<size_t>(fileCount));

        for (const auto& file : std::filesystem::directory_iterator(testsRoot))
        {
            if (file.is_directory())
                continue;

            const std::filesystem::path& filePath = file.path();
            if (filePath.extension() != ".prose")
                continue;

            testFiles.emplace_back(filePath);
        }

        return testFiles;
    }
} // namespace

CLANG_IGNORE_WARNING_PUSH("-Wglobal-constructors")
INSTANTIATE_TEST_SUITE_P(, ParserTest, testing::ValuesIn(getTestFiles("tests/parser")));
INSTANTIATE_TEST_SUITE_P(Negative, ParserTest, testing::ValuesIn(getTestFiles("tests/parser/errors")));

TEST_P(ParserTest, ASTGeneration)
{
    const std::filesystem::path& fileName = GetParam();

    std::string source;
    ASSERT_TRUE(ReadFile(fileName, source));

    std::vector<Token> tokens;
    ASSERT_TRUE(Tokenize(source, tokens));
    Program program;
    const bool parseResult = ParseProgram(tokens, program);

    const std::string expectedFileName = fileName.string() + ".p";
    if (std::filesystem::exists(expectedFileName))
    {
        ASSERT_TRUE(parseResult);

        std::string expectedStr;
        ASSERT_TRUE(ReadFile(expectedFileName, expectedStr));
        ReplaceAll(expectedStr, "\r\n", "\n");

        std::stringstream ss;
        program.Print(ss);
        ASSERT_EQ(expectedStr, ss.str());
    }
    else
    {
        ASSERT_FALSE(parseResult);
    }
}
CLANG_IGNORE_WARNING_POP
#endif
