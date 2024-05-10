#!/bin/bash

# Test includes.
test -d "${PREFIX}/include/GL"

	# Test libraries.
test ! -f "${PREFIX}/lib/libglut.a"
test -f "${PREFIX}/lib/libglut.so"
ldd "${PREFIX}/lib/libglut.so"

# Test linking against glut with CMake
cd test || exit

cmake -GNinja -DCMAKE_BUILD_TYPE=Release .

ninja -j${CPU_COUNT}
ninja install

./test
