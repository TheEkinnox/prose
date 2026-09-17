#pragma once
#define PRAGMA(x) _Pragma(#x)
#if defined(__clang__)
#define CLANG_IGNORE_WARNING_PUSH(warning) PRAGMA(clang diagnostic push) \
PRAGMA(clang diagnostic ignored warning)
#define CLANG_IGNORE_WARNING_POP PRAGMA(clang diagnostic pop)
#define NO_WARNINGS_PUSH CLANG_IGNORE_WARNING_PUSH("-Weverything")
#define NO_WARNINGS_POP CLANG_IGNORE_WARNING_POP
#define NO_DESTROY [[clang::no_destroy]]
#elif defined(_MSC_VER)
#define CLANG_IGNORE_WARNING_PUSH(warning)
#define CLANG_IGNORE_WARNING_POP
#define NO_WARNINGS_PUSH PRAGMA(warning(push, 0))
#define NO_WARNINGS_POP PRAGMA(warning(pop))
#define NO_DESTROY
#elif defined(__GNUC__)
#define CLANG_IGNORE_WARNING_PUSH(warning)
#define CLANG_IGNORE_WARNING_POP
#define NO_WARNINGS_PUSH PRAGMA(GCC diagnostic push) \
PRAGMA(GCC diagnostic ignored "-Wall") PRAGMA(GCC diagnostic ignored "-Wextra") PRAGMA(GCC diagnostic ignored "-Wpedantic")
#define NO_WARNINGS_POP PRAGMA(GCC diagnostic pop)
#define NO_DESTROY
#else
#define CLANG_IGNORE_WARNING_PUSH(warning)
#define CLANG_IGNORE_WARNING_POP
#define NO_WARNINGS_PUSH
#define NO_WARNINGS_POP
#define NO_DESTROY
#endif
