#pragma once
#include <type_traits>

template<typename T>
[[nodiscard]] constexpr std::underlying_type_t<T> Underlying(T t)
{
    static_assert(std::is_enum_v<T>);
    return static_cast<std::underlying_type_t<T>>(t);
}
