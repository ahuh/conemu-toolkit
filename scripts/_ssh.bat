@echo off
call %~dp0include\common.bat %2

if "%CEL_TERM_CLIENT%"=="CONEMU" (
    echo Not implemented for ConEmu
    EXIT /B 1
) else if "%CEL_TERM_CLIENT%"=="WT" (
    wt %CEL_SPLIT_ARG% --title "SSH" -d . cmd /c "ssh %1"
)