cmake_minimum_required(VERSION 3.12)
project(usbcan)

set(CMAKE_CXX_STANDARD 17 "-pthread")


add_executable(usbcan src/canusb.c src/interface.h)
target_link_libraries(${PROJECT_NAME} pthread)

install(TARGETS usbcan EXPORT usbcan DESTINATION bin)