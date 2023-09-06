# Configure hardware platform
set(HW_PLATFORM "STM32L4" CACHE STRING "Select platform to use for compilation")
set_property(CACHE HW_PLATFORM PROPERTY STRINGS STM32L4 STM32F4 HOST)

# Select main source file based on platform
function(select_platform_dependent_main MAIN_SOURCE)
	if (CMAKE_SYSTEM_PROCESSOR STREQUAL "arm")
		if(HW_PLATFORM STREQUAL "STM32L4")
			set(MAIN_SOURCE "main_stm32l4.cpp" "platform/stm32l4/syscalls.c" PARENT_SCOPE)
		elseif(HW_PLATFORM STREQUAL "STM32F4")
			set(MAIN_SOURCE "main_stm32f4.cpp" "platform/stm32f4/syscalls.c" PARENT_SCOPE)

		# default if no platform is selected
		else()
			set(MAIN_SOURCE "main_stm32l4.cpp" "platform/stm32l4/syscalls.c" PARENT_SCOPE)
		endif()
	else()
		set(HW_PLATFORM "HOST" CACHE STRING "Select platform to use for compilation" FORCE)
		set(MAIN_SOURCE "main_win.cpp" PARENT_SCOPE)
	endif()
endfunction()