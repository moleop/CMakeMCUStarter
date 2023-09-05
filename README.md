# CMakeMCUStarter

This is a small CMake starter project for building firmware (for STM32) in C++.
The project comes with presets for different compilers to simplify configuration and on host builds and tests.

Since the use of code generation tools like STM32CubeMX is useful (especially in the beginning of a project) CMake is
used to create a library from the generated files.
The selection of the hardware platform (e.g. STM32L4) is done during CMake configuration.


## Todo
- add detailed explaination for project setup for beginners
- add doxygen
- add google test and or catch2
- configure compiler warnings for different compilers
- setup CI
- add docker

