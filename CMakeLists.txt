cmake_minimum_required(VERSION 3.20 FATAL_ERROR)

set(USE_FOLDERS ON)
project(Prose LANGUAGES CXX C)

set(BASE_FOLDER ${CMAKE_FOLDER})

# Setup cpp version
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED TRUE)

# Setup debug defines
if (MSVC)
    set(CMAKE_C_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} /DDEBUG /D_DEBUG")
    set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} /DDEBUG /D_DEBUG")
else()
    set(CMAKE_C_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -DDEBUG -D_DEBUG")
    set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -DDEBUG -D_DEBUG")
endif()

############
# Examples #
############

# set target
set(TARGET_NAME Examples)

file(GLOB_RECURSE EXAMPLE_FILES ${CMAKE_CURRENT_SOURCE_DIR}/examples/*)
source_group(TREE ${CMAKE_CURRENT_SOURCE_DIR} FILES ${EXAMPLE_FILES})

add_library(${TARGET_NAME} INTERFACE ${EXAMPLE_FILES})

##############
# Executable #
##############

set(CMAKE_FOLDER ${BASE_FOLDER})
add_subdirectory(scribe)