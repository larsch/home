:: RC file for cmd.exe. Call when starting cmd.exe from registry key
:: "HKEY_CURRENT_USER\Software\Microsoft\Command
:: Processor\AutoRun". E.g. "call c:\path\to\cmdrc.cmd".
@echo off
doskey ag=ag --color $*
