# CMakeMCUStarter

This is a small CMake starter project for building firmware (for STM32) in C++.
The project comes with presets for different compilers to simplify configuration and on host builds and tests.


## Details
Since the use of code generation tools like STM32CubeMX are useful (especially in the beginning of a project), 
but we still want to prioritize platform indepent code, CMake is used to create a library from the generated files.

The selection of the hardware platform (e.g. STM32L4) is done during the CMake configuration step.
Depending on the CMake Variable *HW_PLATFORM* the specific library is linked.

We also treat the *platform*_main.cpp files as a plugin to initialize the hardware dependent peripherals and factories
and strategies.


## Requirements
- GCC and or Clang (for builds on host)
- [Arm GNU Toolchain](https://developer.arm.com/downloads/-/arm-gnu-toolchain-downloads)
- [CMake](https://cmake.org/download/) >= 3.22
- [STM32CubeMX](https://www.st.com/en/development-tools/stm32cubemx.html#overview) (if building for STM32)


## Build

### Build
```bash
cmake . --preset <configure-preset>
cmake --build
```

or open in VS Code, select a preset and run build.

### Building for STM32 controller
If your are building for an STM32 platform you will need to generate the necessary code by opening the ioc. file and clicking generate code.

  
## Todo
- integrate other platforms and microcontrollers
- add detailed explanation for project setup for beginners
- configure compiler warnings for different compilers
- setup CI
- add docker


## Credits
[CMake Template by Jason Turner](https://github.com/cpp-best-practices/cmake_template)

