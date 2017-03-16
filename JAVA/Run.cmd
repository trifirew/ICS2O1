@ECHO OFF
SET MYDIR=%cd%

:choosedir
CD %MYDIR%
CLS
ECHO Valid directories in this directory:
DIR /AD /B /D
ECHO.
SET /p directory="Choose one of the directories above: "
CD *%directory%*

:r
CLS
ECHO Now in %cd%
ECHO.
SET newestJava=
FOR /F "delims=|" %%I IN ('DIR "*.java" /B /O:D') DO SET newestJava=%%~nI
ECHO.
ECHO All Java files in this directory:
DIR *.java /B /D
ECHO.
ECHO The newest Java file is %newestJava%.java
SET class=%newestJava%
SET /p class="Enter Java file name without extension: "
:compile
CLS
ECHO Trying to compile %class%.java
ECHO --------------------------------------------------------------------------------
ECHO.
JAVAC %class%.java
JAVA %class%
ECHO.
ECHO --------------------------------------------------------------------------------
ECHO END OF EXECUTION
DEL %class%.class
ECHO - Press A -- run Again
ECHO - Press F -- run another File
ECHO - Press C -- Change directory
ECHO - Press Q -- Quit
CHOICE /C afqc /N
IF %errorlevel%==1 GOTO compile
IF %errorlevel%==2 GOTO r
IF %errorlevel%==3 GOTO quit
IF %errorlevel%==4 GOTO choosedir

:quit
EXIT
