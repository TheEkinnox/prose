#ifdef BUILD_TESTING
#include "lexer.h"

#include "utility/file.h"
#include "utility/strings.h"

#include <filesystem>

NO_WARNINGS_PUSH
#include <gtest/gtest.h>
#include <magic_enum/magic_enum.hpp>
NO_WARNINGS_POP

namespace
{
    class LexerTest : public ::testing::TestWithParam<std::filesystem::path>
    {
    };

    bool LoadTokenStreamFromString(std::string_view tokensStr, std::vector<Token>& out)
    {
        out.clear();
        if (tokensStr.empty())
            return false;

        // Skip header
        tokensStr = tokensStr.substr(tokensStr.find_first_of('\n') + 1);

        size_t offset = 0;
        while (offset < tokensStr.size())
        {
            // Line
            size_t separatorPos = tokensStr.find_first_of(':', offset);
            if (separatorPos == std::string_view::npos)
                continue;

            Token token{};
            std::string_view subStr = tokensStr.substr(offset, separatorPos - offset);
            auto castResult = from_chars(Trim(subStr), token.line);
            if (castResult.ec != std::errc() || castResult.ptr != subStr.data() + subStr.size())
                return false;

            offset = separatorPos + 1;

            // Column
            separatorPos = tokensStr.find_first_of('|', offset);
            if (separatorPos == std::string_view::npos)
                return false;

            subStr = tokensStr.substr(offset, separatorPos - offset);
            castResult = from_chars(Trim(subStr), token.column);
            if (castResult.ec != std::errc() || castResult.ptr != subStr.data() + subStr.size())
                return false;

            offset = separatorPos + 1;

            // Type
            separatorPos = tokensStr.find_first_of('|', offset);
            if (separatorPos == std::string_view::npos)
                return false;

            subStr = tokensStr.substr(offset, separatorPos - offset);
            const auto type = magic_enum::enum_cast<TokenType>(Trim(subStr));
            if (!type)
                return false;

            token.type = *type;

            offset = separatorPos + 1;

            // Type
            separatorPos = std::min(tokensStr.find_first_of('\n', offset), tokensStr.size());
            subStr = tokensStr.substr(offset, separatorPos - offset);

            token.value = Trim(subStr);

            out.emplace_back(std::move(token));
            offset = separatorPos + 1;
        }

        return true;
    }
} // namespace

CLANG_IGNORE_WARNING_PUSH("-Wglobal-constructors")
INSTANTIATE_TEST_SUITE_P(, LexerTest, testing::ValuesIn(GetTestFiles("tests/lexer")));
INSTANTIATE_TEST_SUITE_P(Negative, LexerTest, testing::ValuesIn(GetTestFiles("tests/lexer/errors")));

TEST_P(LexerTest, Tokenization)
{
    const std::filesystem::path& fileName = GetParam();

    std::string source;
    ASSERT_TRUE(ReadFile(fileName, source));
    std::vector<Token> tokens;
    const bool tokenizeResult = Tokenize(source, tokens);

    const std::string expectedFileName = fileName.string() + ".l";
    if (std::filesystem::exists(expectedFileName))
    {
        ASSERT_TRUE(tokenizeResult);

        std::string expectedStr;
        ASSERT_TRUE(ReadFile(expectedFileName, expectedStr));

        std::vector<Token> expectedTokens;
        ASSERT_TRUE(LoadTokenStreamFromString(expectedStr, expectedTokens));

        ASSERT_EQ(expectedTokens.size(), tokens.size());
        for (size_t i = 0; i < expectedTokens.size(); ++i)
        {
            const Token& expected = expectedTokens[i];
            const Token& received = tokens[i];
            ASSERT_EQ(expected.line, received.line);
            ASSERT_EQ(expected.column, received.column);
            ASSERT_EQ(expected.type, received.type);
            ASSERT_EQ(expected.GetValueString(), received.GetValueString());
        }
    }
    else
    {
        ASSERT_FALSE(tokenizeResult);
    }
}
CLANG_IGNORE_WARNING_POP
#endif
