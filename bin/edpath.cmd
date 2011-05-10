:: Run edpath.rb update the local process environment by
:: running a .cmd script written by edpath.rb.
@echo off
ruby %HOME%\bin\edpath.rb
if exist "%TEMP%\postedpath.cmd" call "%TEMP%\postedpath.cmd"
if exist "%TEMP%\postedpath.cmd" del "%TEMP%\postedpath.cmd"
