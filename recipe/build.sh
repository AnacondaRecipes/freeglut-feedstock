#!/bin/bash


mkdir build && cd build
cmake \
	-DCMAKE_INSTALL_PREFIX=$PREFIX          \
	-DCMAKE_INSTALL_LIBDIR=$PREFIX/lib      \
	-DCMAKE_BUILD_TYPE=Release              \
	-DFREEGLUT_BUILD_DEMOS=OFF              \
	-DFREEGLUT_BUILD_STATIC_LIBS=OFF        \
	-DFREEGLUT_BUILD_SHARED_LIBS=ON         \
	..

make
make install
