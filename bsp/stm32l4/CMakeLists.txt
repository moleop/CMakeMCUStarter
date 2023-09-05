
# Optional: print out extra messages to see what is going on. Comment it to have less verbose messages
set(CMAKE_VERBOSE_MAKEFILE ON)

# Setup project, output and linker file
project(STM32L4_BSP)
set(EXECUTABLE ${PROJECT_NAME})
set(LINKER_FILE ${CMAKE_CURRENT_SOURCE_DIR}/STM32L452RETx_FLASH.ld)

enable_language(CXX C ASM)
#set(CMAKE_C_STANDARD 99)
#set(CMAKE_C_STANDARD_REQUIRED ON)
#set(CMAKE_C_EXTENSIONS OFF)

# Optional: issue a message to be sure it uses the correct toolchain file.
message(STATUS "CMAKE_TOOLCHAIN_FILE is: ${CMAKE_TOOLCHAIN_FILE}")

# List of source files
set(SRC_FILES
    startup_stm32l452xx.s
    syscalls.c
    Core/Src/main.c 
    Core/Src/gpio.c 
    Core/Src/stm32l4xx_it.c 
    Core/Src/stm32l4xx_hal_msp.c 
    Drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_hal_tim.c 
    Drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_hal_tim_ex.c 
    Drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_hal.c 
    Drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_hal_rcc.c 
    Drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_hal_rcc_ex.c 
    Drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_hal_flash.c 
    Drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_hal_flash_ex.c 
    Drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_hal_flash_ramfunc.c 
    Drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_hal_gpio.c 
    Drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_hal_dma.c 
    Drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_hal_dma_ex.c 
    Drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_hal_pwr.c 
    Drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_hal_pwr_ex.c 
    Drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_hal_cortex.c 
    Drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_hal_exti.c 
    Core/Src/system_stm32l4xx.c
    )

# Build the executable based on the source files
set(BINARY_NAME ${PROJECT_NAME}_LIB)
#add_executable(${BINARY_NAME} ${SRC_FILES})
add_library(${BINARY_NAME} STATIC ${SRC_FILES})

# List of compiler defines, prefix with -D compiler option
target_compile_definitions(${BINARY_NAME} PUBLIC
        -DUSE_HAL_DRIVER
        -DSTM32L452xx
        )

# List of includ directories
target_include_directories(${BINARY_NAME} PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}/Core/Inc 
        ${CMAKE_CURRENT_SOURCE_DIR}/Drivers/STM32L4xx_HAL_Driver/Inc 
        ${CMAKE_CURRENT_SOURCE_DIR}/Drivers/STM32L4xx_HAL_Driver/Inc/Legacy 
        ${CMAKE_CURRENT_SOURCE_DIR}/Drivers/CMSIS/Device/ST/STM32L4xx/Include 
        ${CMAKE_CURRENT_SOURCE_DIR}/Drivers/CMSIS/Include
        )

# Compiler options
target_compile_options(${BINARY_NAME} PUBLIC
        -mcpu=cortex-m4     # Target processor architecture
        -mthumb             # Thumb instruction set
        -mfpu=fpv4-sp-d16   # Floating point unit
        -mfloat-abi=hard    # Use hardware floating point unit

        -fdata-sections     # Place each data item into its own section
        -ffunction-sections # Place each function into its own section

        -Wall               # Enable all warnings
        -O0                 # Optimization level 0
        -g3                 # Debug level 3
        )

# Linker options
target_link_options(${BINARY_NAME} PUBLIC
        -T${LINKER_FILE}
        -mcpu=cortex-m4
        -mthumb
        -mfpu=fpv4-sp-d16
        -mfloat-abi=hard
        -specs=nano.specs   # Use the nano.specs from the GCC source code to link with the C library (libc) for embedded systems (nano.specs is a linker script) 
        -lc                 # Use the C library (libc)
        -lm                 # Use the math library (libm)
        #-lnosys             # Do not use any other library (libnosys)
        -Wl,-Map=${PROJECT_NAME}.map,--cref
        -Wl,--gc-sections
        -Xlinker -print-memory-usage -Xlinker
        )

