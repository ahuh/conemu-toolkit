@echo off
call %~dp0include\common.bat %1

if "%CEL_TERM_CLIENT%"=="CONEMU" (
    "%CEL_CONEMU_PATH%" -reuse -run cmd.exe /c "cleanmgr /lowdisk /dC" -new_console:%CEL_SPLIT_ARG%:n:a:P:"%CEL_CONEMU_ADMIN_PALETTE%":t:"Disk Cleaner"
) else if "%CEL_TERM_CLIENT%"=="WT" (
    wt %CEL_SPLIT_ARG% -p "%CEL_WT_CMD_ADMIN_PROFILE%" --title "Disk Cleaner" --appendCommandLine -command %~dp0subscripts\disk-cleaner.bat
)