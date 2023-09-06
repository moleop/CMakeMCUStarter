

add_subdirectory(platform)

# platform independent sources
set (PROJECT_SOURCES )

set(MAIN_SOURCE)
select_platform_dependent_main(MAIN_SOURCE)

set(EXECUTABLE ${PROJECT_NAME})
add_executable(${EXECUTABLE} ${MAIN_SOURCE} ${PROJECT_SOURCES})
target_link_libraries(${EXECUTABLE} PRIVATE platform)