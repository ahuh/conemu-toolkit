@echo off
call %~dp0include\common.bat %1

if "%CEL_TERM_CLIENT%"=="CONEMU" (
    "%CEL_CONEMU_PATH%" -reuse -run "%CEL_WSL_PATH%" bash -i -c "sudo apt update; sudo apt upgrade -y; sudo apt autoremove -y" -new_console:%CEL_SPLIT_ARG%:c:P:"%CEL_CONEMU_WSL_PALETTE%":t:"WSL Update"
) else if "%CEL_TERM_CLIENT%"=="WT" (
    wt %CEL_SPLIT_ARG% -p "%CEL_WT_WSL_UPDATE_PROFILE%" --title "WSL Update"
)
