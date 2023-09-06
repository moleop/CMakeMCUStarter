cmake_minimum_required(VERSION 3.20)
set(PROJECT_NAME "CMakeMCUStarter")
set(PROJECT_BRIEF "CMake Starter Project for Microcontrollers" CACHE STRING "Brief description of the project")
project(${PROJECT_NAME} VERSION 0.0.1)
enable_language(ASM C CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)


include(FetchContent)
include(PlatformOptions.cmake)
include(cmake/Doxygen.cmake)

set(EXCLUDE_PATHS_FROM_DOC 
    "${CMAKE_SOURCE_DIR}/src/platform/stm32l4"
    "${CMAKE_SOURCE_DIR}/src/platform/stm32f4"
    "${CMAKE_SOURCE_DIR}/src/platform/host")
enable_doxygen("" ${EXCLUDE_PATHS_FROM_DOC})

add_subdirectory(src)

include(CTest)
enable_testing()
