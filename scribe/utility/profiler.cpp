#include "profiler.h"

#include "utility/time.h"

#include <iostream>

ScopeProfiler::ScopeProfiler(std::string name) : m_name(std::move(name)), m_start(ProfilerClock::now())
{
}

ScopeProfiler::~ScopeProfiler()
{
    const auto duration = std::chrono::duration_cast<std::chrono::nanoseconds>(ProfilerClock::now() - m_start);
    std::cout << m_name << " took " << DurationToString(duration) << std::endl;
}
