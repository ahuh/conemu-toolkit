@echo off
call %~dp0include\common.bat %1
"%CEL_CONEMU_PATH%" -reuse -run "%CEL_WSL_PATH%" bash -i -c "sudo apt update; sudo apt upgrade -y; sudo apt autoremove -y" -new_console:%CEL_SPLIT_ARG%:c:P:"%CEL_CONEMU_PWSH_PALETTE%":t:"WSL Update"