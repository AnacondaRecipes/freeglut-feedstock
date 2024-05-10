mkdir build && cd build
cmake -LAH -GNinja                           ^
	-DCMAKE_BUILD_TYPE=Release               ^
	-DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX%  ^
	-DCMAKE_INSTALL_BINDIR=%LIBRARY_BIN%     ^
	-DCMAKE_INSTALL_LIBDIR=%LIBRARY_LIB%     ^
	-DCMAKE_INSTALL_INCLUDEDIR=%LIBRARY_INC% ^
	-DFREEGLUT_REPLACE_GLUT=ON               ^
	-DFREEGLUT_BUILD_DEMOS=OFF               ^
	-DFREEGLUT_BUILD_STATIC_LIBS=OFF         ^
	-DFREEGLUT_BUILD_SHARED_LIBS=ON          ^
	..

ninja -j%CPU_COUNT%
IF %ERRORLEVEL% NEQ 0 exit 1

ninja install
IF %ERRORLEVEL% NEQ 0 exit 1

mklink /h %LIBRARY_BIN%\freeglut.dll %LIBRARY_BIN%\glut.dll
mklink /h %LIBRARY_LIB%\freeglut.lib %LIBRARY_LIB%\glut.lib
