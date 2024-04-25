cmake_minimum_required(VERSION 3.16)

project(FreeGlutTest LANGUAGES C)

find_package(GLUT REQUIRED)

add_executable(test test.c)

target_link_libraries(test PRIVATE GLUT::GLUT)
