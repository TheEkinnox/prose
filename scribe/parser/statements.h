#pragma once
#include "parser/fwd.h"

#include <iosfwd>

struct Statement
{
    Statement() = default;
    Statement(const Statement&) = default;
    Statement& operator=(const Statement&) = default;
    virtual ~Statement() = default;

    virtual std::ostream& Print(std::ostream& os, ParserDepthT depth) const = 0;
};
