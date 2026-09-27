include(FetchContent)

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