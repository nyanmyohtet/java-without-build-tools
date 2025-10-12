@echo off
REM ==================================================
REM Script to compile and run a Java program on Windows
REM ==================================================

REM Clear output dirs
call clean.bat

cd src

echo Current directory:
cd

REM Compile the Java source file
REM /d option specifies output dir for class files
javac -d ..\bin com\javaproject\Main.java

IF %ERRORLEVEL% NEQ 0 (
    echo Compilation failed.
    exit /b 1
)

echo Compilation success.

cd ..\bin

echo Current directory:
cd

java com.javaproject.Main

pause