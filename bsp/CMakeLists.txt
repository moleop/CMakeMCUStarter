
add_library(platform platform.cpp platform.h)
target_include_directories(platform PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

if(HW_PLATFORM STREQUAL "STM32L452")
    message(STATUS "Building for STM32L452")
    add_subdirectory(stm32l4)
    target_link_libraries(platform PUBLIC STM32L4_BSP_LIB)
else(HW_PLATFORM STREQUAL "HOST")
    message(STATUS "Building for Host")
    add_subdirectory(host)
endif()


