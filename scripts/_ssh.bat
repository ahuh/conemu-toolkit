@echo off
call %~dp0include\common.bat %2

if "%CEL_TERM_CLIENT%"=="WT" (
    wt %CEL_SPLIT_ARG% --title "SSH" cmd /c "ssh %1"
)