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
    class ParserFileTest : public ::testing::TestWithParam<std::filesystem::path>
    {
    };

    struct ParserSourceTestArgs
    {
        using TestFunc = void(TokenStream&);

        std::string name;
        std::string source;
        TestFunc& testFunc;
    };

    class ParserSourceTest : public ::testing::TestWithParam<ParserSourceTestArgs>
    {
    };

    std::vector<std::filesystem::path> GetTestFiles(const std::filesystem::path& testsRoot)
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

    void RequireStatementShouldFail(TokenStream& stream)
    {
        std::unique_ptr<Statement> statement;
        ASSERT_FALSE(RequireStatement(stream, statement));
        ASSERT_EQ(nullptr, statement);
    }

    std::vector<ParserSourceTestArgs> GetSourceTests()
    {
        std::vector<ParserSourceTestArgs> tests;
        tests.emplace_back("UnclosedFor", "for i in 0..10", RequireStatementShouldFail);
        tests.emplace_back("UnclosedIf", "if true", RequireStatementShouldFail);
        tests.emplace_back("UnclosedRepeat", "repeat\nuntil condition", RequireStatementShouldFail);
        tests.emplace_back("UnclosedRepeatWithFollowingToken", "repeat\nuntil condition return", RequireStatementShouldFail);
        tests.emplace_back("UnclosedScope", "scope", RequireStatementShouldFail);
        tests.emplace_back("UnclosedSwitch", "switch value\ndefault", RequireStatementShouldFail);
        tests.emplace_back("UnclosedWhile", "while true", RequireStatementShouldFail);
        return tests;
    }

    std::string GetSourceTestName(const testing::TestParamInfo<ParserSourceTest::ParamType>& info)
    {
        return info.param.name;
    }
} // namespace

CLANG_IGNORE_WARNING_PUSH("-Wglobal-constructors")
INSTANTIATE_TEST_SUITE_P(, ParserFileTest, testing::ValuesIn(GetTestFiles("tests/parser")));
INSTANTIATE_TEST_SUITE_P(Negative, ParserFileTest, testing::ValuesIn(GetTestFiles("tests/parser/errors")));

INSTANTIATE_TEST_SUITE_P(, ParserSourceTest, testing::ValuesIn(GetSourceTests()), GetSourceTestName);

TEST_P(ParserFileTest, ASTGeneration)
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

TEST_P(ParserSourceTest, ASTGeneration)
{
    const ParserSourceTestArgs& args = GetParam();

    std::vector<Token> tokens;
    ASSERT_TRUE(Tokenize(args.source, tokens));

    TokenStream stream(tokens);
    args.testFunc(stream);
}
CLANG_IGNORE_WARNING_POP
#endif
