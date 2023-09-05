cmake_minimum_required(VERSION 3.20)
set(PROJECT_NAME "CMakeMCUStarter")
set(PROJECT_BRIEF "CMake Starter Project for Microcontrollers" CACHE STRING "Brief description of the project")
project(${PROJECT_NAME} VERSION 0.0.1)
enable_language(ASM C CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# set the compiler flags for platform
include(PlatformOptions.cmake)

add_subdirectory(bsp)

# platform independent sources
set (PROJECT_SOURCES )

set(EXECUTABLE ${PROJECT_NAME})
add_executable(${EXECUTABLE} ${MAIN_SOURCE} ${PROJECT_SOURCES})
target_link_libraries(${EXECUTABLE} PRIVATE platform)

include(CTest)
enable_testing()
