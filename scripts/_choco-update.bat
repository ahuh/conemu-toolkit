@echo off
call %~dp0include\common.bat %1

if "%CEL_TERM_CLIENT%"=="CONEMU" (
    "%CEL_CONEMU_PATH%" -reuse -run cmd.exe /c "choco upgrade all -y" -new_console:%CEL_SPLIT_ARG%:c:a:P:"%CEL_CONEMU_ADMIN_PALETTE%":t:"Choco Update"
) else if "%CEL_TERM_CLIENT%"=="WT" (
    wt %CEL_SPLIT_ARG% -p "%CEL_WT_CMD_ADMIN_PROFILE%" --title "Choco Update" --appendCommandLine %~dp0subscripts\choco-update.bat
)