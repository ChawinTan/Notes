cmake_minimum_required(VERSION 3.5)
project(Main)
#find_package(cpp-jwt REQUIRED)

add_subdirectory(jwt-cpp)

add_executable(${PROJECT_NAME} main.cpp)
target_link_libraries(${PROJECT_NAME} 
  jwt-cpp
)