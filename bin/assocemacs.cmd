@echo off
assoc .c=EmacsSourceFile
assoc .cpp=EmacsSourceFile
assoc .cc=EmacsSourceFile
assoc .cxx=EmacsSourceFile
assoc .h=EmacsSourceFile
assoc .hpp=EmacsSourceFile
assoc .hh=EmacsSourceFile
assoc .hxx=EmacsSourceFile
ftype EmacsSourceFile=c:\appl\EmacsW32\emacs\bin\emacsclientw.exe -n "%%1" %%*
