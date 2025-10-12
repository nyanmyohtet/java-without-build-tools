@echo off
REM ==================================================
REM Script to compile and test Java classes on Windows
REM ==================================================

REM Clear output dirs (uncomment if you have clean.bat)
REM call clean.bat

echo Listing contents of bin directory:
dir bin

cd src

echo Current directory:
cd

REM Compile the Java test file
javac -d ..\bin -cp .;..\libs\* com\javaproject\Main.java com\javaproject\CalculatorTest.java

IF %ERRORLEVEL% NEQ 0 (
    echo Compilation failed.
    exit /b 1
)

echo Compilation success.

cd ..\bin

echo Current directory:
cd

REM Run JUnit tests with JaCoCo agent
java -javaagent:..\libs\org.jacoco.agent-0.8.13-runtime.jar=destfile=jacoco.exec ^
-cp .;..\libs\* org.junit.runner.JUnitCore com.javaproject.CalculatorTest

cd ..

echo Current directory:
cd

REM Generate JaCoCo HTML report
java -cp libs\org.jacoco.cli-0.8.13.jar;libs\args4j-2.37.jar;libs\org.jacoco.core-0.8.13.jar;libs\org.jacoco.report-0.8.13.jar;libs\asm-9.9.jar;libs\asm-tree-9.9.jar;libs\asm-commons-9.9.jar ^
org.jacoco.cli.internal.Main report bin\jacoco.exec --classfiles bin\ --sourcefiles src\ --html report

pause