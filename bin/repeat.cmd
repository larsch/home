@echo off
:again
call %*
if errorlevel 1 goto :eof
goto :again