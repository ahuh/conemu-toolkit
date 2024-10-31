@echo off
call %~dp0include\common.bat %1
"%CEL_CONEMU_PATH%" -reuse -run pwsh.exe -new_console:%CEL_SPLIT_ARG%:P:"%CEL_CONEMU_PWSH_PALETTE%"