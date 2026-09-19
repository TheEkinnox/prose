#pragma once
#include "macros.h"

#include <chrono>
#include <string>

#define ProfileScope(name) ScopeProfiler ANON(profiler)(name)

using ProfilerClock = std::chrono::high_resolution_clock;

class ScopeProfiler
{
public:
    explicit ScopeProfiler(std::string name);
    ~ScopeProfiler();

private:
    std::string m_name;
    ProfilerClock::time_point m_start;
};
