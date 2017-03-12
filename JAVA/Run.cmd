@ECHO OFF
set MYDIR=%cd%
:c
cd %MYDIR%
cls
ECHO Valid directories in this directory:
dir /AD /B /D
echo.
set /p directory="Choose one of the directories above: "
cd %directory%
:r
cls
echo Now in %cd%
ECHO.
set newestJava=
FOR /F "delims=|" %%I IN ('DIR "*.java" /B /O:D') DO SET newestJava=%%~nI
echo The newest Java file is %newestJava%.java
echo.
echo Other Java files in this directory:
DIR *.java /B /D
ECHO.
set class=%newestJava%
set /p class="Enter Java file name without extension: "
echo Trying to compile %class%.java
echo --------------------------------------------------------------------------------
echo.
javac %class%.java
java %class%
echo.
echo --------------------------------------------------------------------------------
echo END OF EXECUTION
echo - Press R to run another file
echo - Press Q to quit
echo - Press C to change directory
choice /C rqc /N
IF %errorlevel%==1 GOTO r
IF %errorlevel%==2 GOTO q
IF %errorlevel%==3 GOTO c
:q
EXIT
