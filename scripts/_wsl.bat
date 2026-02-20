@echo off
call %~dp0include\common.bat %1

if "%CEL_TERM_CLIENT%"=="CONEMU" (
    "%CEL_CONEMU_PATH%" -reuse -run "%CEL_WSL_PATH%" -new_console:%CEL_SPLIT_ARG%:P:"%CEL_CONEMU_WSL_PALETTE%":pm:/mnt
) else if "%CEL_TERM_CLIENT%"=="WT" (
    wt %CEL_SPLIT_ARG% -p "%CEL_WT_WSL_PROFILE%"
)