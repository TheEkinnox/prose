#pragma once
#include <memory>

template<typename T, typename S>
std::unique_ptr<T> dynamic_pointer_cast(std::unique_ptr<S>&& p) noexcept
{
    auto converted = std::unique_ptr<T>{dynamic_cast<T*>(p.get())};
    if (converted) {
        p.release();
    }

    return converted;
}
