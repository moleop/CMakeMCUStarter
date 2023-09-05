# Configure hardware platform
set(HW_PLATFORM "STM32L452" CACHE STRING "Select platform to use for compilation")
set_property(CACHE HW_PLATFORM PROPERTY STRINGS STM32L452 HOST)

# Select main source file based on platform
if (CMAKE_SYSTEM_PROCESSOR STREQUAL "arm")
	if(HW_PLATFORM STREQUAL "STM32L452")
		set(MAIN_SOURCE main_stm32l4.cpp)
	endif()
else()
	set(HW_PLATFORM "HOST" CACHE STRING "Select platform to use for compilation" FORCE)
	set(MAIN_SOURCE main_win.cpp)
endif()