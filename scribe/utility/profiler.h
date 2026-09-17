#pragma once
#include "macros.h"

#include <chrono>
#include <string>

#define ProfileScope(name) ScopeProfiler ANON(profiler)(name)

using Clock = std::chrono::high_resolution_clock;

class ScopeProfiler
{
public:
    explicit ScopeProfiler(std::string name);
    ~ScopeProfiler();

private:
    std::string m_name;
    Clock::time_point m_start;
};
