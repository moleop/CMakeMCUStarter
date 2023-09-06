# CMakeMCUStarter

This is a small CMake starter project for building firmware (for STM32) in C++.
The project comes with presets for different compilers to simplify configuration and on host builds and tests.


## Details
Since the use of code generation tools like STM32CubeMX are useful (especially in the beginning of a project), 
but we still want to prioritize platform indepent code, CMake is used to create a library from the generated files.

The selection of the hardware platform (e.g. STM32L4) is done during the CMake configuration step.

We also treat the *platform*_main.cpp files as a plugin to initialize the hardware dependent peripherals and factories
and strategies.

  
## Todo
- add detailed explanation for project setup for beginners
- add google test and or catch2
- configure compiler warnings for different compilers
- setup CI
- add docker


## Credits
[CMake Template by Jason Turner](https://github.com/cpp-best-practices/cmake_template)

