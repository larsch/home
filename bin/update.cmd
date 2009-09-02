@echo off
if not defined APPL set APPL=c:\appl

cd %HOME%
attrib /S /D +H .*

cd %HOME%\bin
wget -q -m -nd http://live.sysinternals.com/desktops.exe

if not exist "%APPL%\rubyinstaller-1.8.7-p383-preview2" (
  wget -m -nd -P %TEMP% http://rubyforge.org/frs/download.php/62212/rubyinstaller-1.8.6-p383-preview2.exe
  "%TEMP%\rubyinstaller-1.8.6-p383-preview2.exe" "/DIR=%APPL%\rubyinstaller-1.8.7-p383-preview2" /SILENT
  del "%TEMP%\rubyinstaller-1.8.6-p383-preview2.exe"
)

if not exist "%APPL%\rubyinstaller-1.9.1-p243-preview2" (
  wget -m -nd -P %TEMP% http://rubyforge.org/frs/download.php/62213/rubyinstaller-1.9.1-p243-preview2.exe
  "%TEMP%\rubyinstaller-1.9.1-p243-preview2.exe" "/DIR=%APPL%\rubyinstaller-1.9.1-p243-preview2" /SILENT
  del "%TEMP%\rubyinstaller-1.9.1-p243-preview2.exe"
)

if not exist "%APPL%\bin\pslist.exe" (
  if not exist "%APPL%\bin" mkdir "%APPL%\bin"
  wget -m -nd -P %TEMP% http://download.sysinternals.com/Files/SysinternalsSuite.zip
  unzip -q -d "%APPL%\bin" %TEMP%\SysinternalsSuite.zip
  del "%TEMP%\SysinternalsSuite.zip"
)
