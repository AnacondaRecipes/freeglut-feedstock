#!/bin/bash

set -euxo pipefail

# Test the GL includes folder.
test -d "${PREFIX}/include/GL"

# Test libraries and a pkgconfig file.
test ! -f "${PREFIX}/lib/libglut.a" || exit 1
test -f "${PREFIX}/lib/libglut.so" || exit 1
test -f "${PREFIX}/lib/libglut.so.3" || exit 1
test -f "${PREFIX}/lib/libglut.so.3.11.1" || exit 1
test -f "${PREFIX}/lib/pkgconfig/glut.pc" || exit 1
# Test headers.
test -f "${PREFIX}/include/GL/freeglut.h" || exit 1
test -f "${PREFIX}/include/GL/freeglut_ext.h" || exit 1
test -f "${PREFIX}/include/GL/freeglut_std.h" || exit 1
test -f "${PREFIX}/include/GL/freeglut_ucall.h" || exit 1
test -f "${PREFIX}/include/GL/glut.h" || exit 1

ldd "${PREFIX}/lib/libglut.so"

# Test linking against glut with CMake
cd test || exit

cmake -GNinja -DCMAKE_BUILD_TYPE=Release .

cmake --build . --config Release

./test
