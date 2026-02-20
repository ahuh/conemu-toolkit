@echo off
call %~dp0include\common.bat %1

if "%CEL_TERM_CLIENT%"=="CONEMU" (
    "%CEL_CONEMU_PATH%" -reuse -run pwsh.exe -new_console:%CEL_SPLIT_ARG%:a:P:"%CEL_CONEMU_ADMIN_PALETTE%"
) else if "%CEL_TERM_CLIENT%"=="WT" (
    wt %CEL_SPLIT_ARG% -p "%CEL_WT_PWSH_ADMIN_PROFILE%"
)