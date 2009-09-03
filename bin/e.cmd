@rem Put this file (e.cmd) in your PATH.
@rem (Created by Setup Helper at Wed Feb 27 15:31:08 2008)
@rem -----------------------------
@rem Starts Emacs (through emacsclient) from command line.
@rem This can be used in many ways:
@rem    With a file as parameter: Start editing this file
@rem    With a directory as a parameter: Start dired
@rem If the first argument to this file is -e then there are
@rem two enhancements:
@rem    1) Before executing the -e command Emacs changes dir to current dir.
@rem    2) embedded in the -e parameter is converted to /.
@rem Then you can do for example to start ediff in Emacs do
@rem    e.cmd -e "(ediff-files \"fil1.txt\" \"fil 2.txt\")"
@setlocal
@set args=%*
@if not defined APPL set APPL=c:\appl
@set emacs_client="%APPL%\emacs-23.1\bin\emacsclient.exe"
@if not A%1 == A-e goto noE
@   set args=%args:\=/%
@   set args=%args:/"=\"%
@   set emacs_cd=%CD:\=/%
@   %emacs_client% -e "(setq default-directory \"%emacs_cd%\")"
:noE
@%emacs_client% -a "%APPL%\emacs-23.1\bin\runemacs.exe" -n %args%
