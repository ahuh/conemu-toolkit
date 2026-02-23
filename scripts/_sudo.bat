@echo off
SETLOCAL EnableDelayedExpansion
if "%CEL_TERM_CLIENT%"=="CONEMU" (
    set SUDO_NOARG=
    if ""%1""=="""" set SUDO_NOARG=1
    if ""%1""==""+"" set SUDO_NOARG=1
    if ""%1""==""-"" set SUDO_NOARG=1
    if "%SUDO_NOARG%"=="1" (
        call %~dp0include\common.bat %1
        "!CEL_CONEMU_PATH!" -reuse -run cmd.exe /k "!CEL_CONEMU_INIT_SCRIPT!" -new_console:!CEL_SPLIT_ARG!:a:P:"!CEL_CONEMU_ADMIN_PALETTE!"
    ) else (
        call %~dp0include\common.bat %2
        "!CEL_CONEMU_PATH!" -reuse -run cmd.exe /k ""!CEL_CONEMU_INIT_SCRIPT!" && "%1"" -new_console:!CEL_SPLIT_ARG!:a:P:"!CEL_CONEMU_ADMIN_PALETTE!"
    )
) else if "%CEL_TERM_CLIENT%"=="WT" (
    echo Not implemented for Windows Terminal
    EXIT /B 1
)