include(FetchContent)

#############
# MagicEnum #
#############
FetchContent_Declare(
        magic_enum
        GIT_REPOSITORY https://github.com/Neargye/magic_enum
        GIT_TAG v0.9.8
        GIT_SHALLOW 1
)

set(MAGIC_ENUM_OPT_BUILD_EXAMPLES off)
set(MAGIC_ENUM_OPT_BUILD_TESTS off)
set(MAGIC_ENUM_OPT_INSTALL off)
set(MAGIC_ENUM_USE_MODULES off)
set(MAGIC_ENUM_MODULE_IMPORT_STD off)
set(MAGIC_ENUM_MODULE_WITH_FMT off)
set(MAGIC_ENUM_OPT_INSTALL_PACKAGE_XML off)
FetchContent_MakeAvailable(magic_enum)

#########
# GTEST #
#########
if (${BUILD_TESTING})
    FetchContent_Declare(
            googletest
            GIT_REPOSITORY https://github.com/google/googletest
            GIT_TAG v1.18.0
            GIT_SHALLOW 1
    )

    # For Windows: Prevent overriding the parent project's compiler/linker settings
    set(BUILD_GMOCK OFF)
    set(INSTALL_GTEST OFF)
    set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
    set(gtest_build_tests OFF)
    set(gtest_build_samples OFF)
    set(gtest_disable_pthreads OFF)
    set(gtest_hide_internal_symbols OFF)
    FetchContent_MakeAvailable(googletest)
endif()