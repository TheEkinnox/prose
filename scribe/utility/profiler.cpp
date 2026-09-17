#include "profiler.h"

#include <iostream>

static Clock& GetClock()
{
    static Clock clock;
    return clock;
}


ScopeProfiler::ScopeProfiler(std::string name) : m_name(std::move(name)), m_start(GetClock().now())
{
}

ScopeProfiler::~ScopeProfiler()
{
    const auto duration = std::chrono::duration_cast<std::chrono::milliseconds>(GetClock().now() - m_start);
    std::cout << m_name << " took " << duration.count() << "ms" << std::endl;
}
