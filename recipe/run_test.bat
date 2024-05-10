@echo on

setlocal EnableDelayedExpansion

REM Test Windows includes and libraries.
if not exist %LIBRARY_INC%\\GL\\freeglut.h     exit 1
if not exist %LIBRARY_INC%\\GL\\freeglut_ext.h exit 1
if not exist %LIBRARY_INC%\\GL\\freeglut_std.h exit 1
if not exist %LIBRARY_INC%\\GL\\glut.h         exit 1
if not exist %LIBRARY_LIB%\\freeglut.lib       exit 1
if not exist %LIBRARY_BIN%\\freeglut.dll       exit 1

cd test

:: Compile and run example that links glut with CMake
cmake -GNinja -DCMAKE_BUILD_TYPE=Release .
if errorlevel 1 exit 1

cmake --build . --config Release
if errorlevel 1 exit 1

.\test.exe
if errorlevel 1 exit 1
