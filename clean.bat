@echo off
REM ==================================================
REM Script to clean bin and report directories on Windows
REM ==================================================

echo Start cleaning bin dir.

if exist bin (
    del /q /s bin\*
) else (
    echo bin directory not found, creating it...
    mkdir bin
)

echo Finish cleaning bin dir.

echo Start cleaning report dir.

if exist report (
    del /q /s report\*
) else (
    echo report directory not found, creating it...
    mkdir report
)

echo Finish clean report dir.
