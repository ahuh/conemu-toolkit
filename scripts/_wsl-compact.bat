@echo off
call %~dp0include\common.bat %1
"%CEL_CONEMU_PATH%" -reuse -run pwsh.exe -c "wslcompact -c -y %CEL_WSL_DISTRIB%" -new_console:%CEL_SPLIT_ARG%:c:P:"%CEL_CONEMU_PWSH_PALETTE%":t:"WSL Compact"