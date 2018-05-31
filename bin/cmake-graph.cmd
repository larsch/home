@echo off
if not exist CMakeCache.txt goto :missing_cmakecache
where dot >NUL 2>&1 || goto :missing_dot

set name=%1
if x%name% == x goto :missing_name
cmake --graphviz=graphviz/graphviz . || exit /b 1
dot -Tpng -O "graphviz\graphviz.%name%" || exit /b 1
start graphviz\graphviz.%name%.png
goto :eof

:missing_name
echo Usage: cmake-graph ^<target^>
goto :eof

:missing_cmakecache
echo Need to run from a CMake build directory (with CMakeCache.txt)
goto :eof

:missing_dot
echo Missing dot.exe from Graphviz. Please install and put in PATH.
goto :eof