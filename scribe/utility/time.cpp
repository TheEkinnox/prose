#include "utility/time.h"

#include <chrono>
#include <queue>

std::string DurationToString(const std::chrono::nanoseconds duration)
{
    auto durationVal = duration.count();

    if (durationVal < 1'000)
        return std::to_string(durationVal) + " ns";

    struct Unit
    {
        using mult_t = decltype(decltype(duration)::period::den);

        const char* unit;
        mult_t multiplier;
    };

    struct TimePair
    {
        decltype(duration) ns;
        Unit unit;
    };

    constexpr Unit units[] = {
        { "ns", 1 },
        { "us", 1'000 },
        { "ms", 1'000'000 },
        { "s", 1'000'000'000 },
        { "min", 60'000'000'000 },
        { "h", 3'600'000'000'000 }
    };

    std::stringstream ss;

    bool isFirst = true;
    for (size_t i = std::size(units); i > 0; --i)
    {
        const auto& [unit, multiplier] = units[i - 1];

        if (durationVal < multiplier)
            continue;

        if (!isFirst)
            ss << ' ';

        ss << durationVal / multiplier << unit;

        if (i == 2 && !isFirst)
            break;

        durationVal %= multiplier;
        isFirst = false;
    }

    return ss.str();
}
