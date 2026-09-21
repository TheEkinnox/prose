#pragma once
#include "parser/fwd.h"

#include <memory>
#include <string_view>
#include <vector>

struct Program
{
    std::vector<std::unique_ptr<Declaration>> declarations;

    std::ostream& Print(std::ostream& os) const;
};

void LogError(const Token& token, std::string_view message);
bool ParseProgram(const std::vector<Token>& tokens, Program& out);
