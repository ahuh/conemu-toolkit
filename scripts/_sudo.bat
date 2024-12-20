@echo off
call %~dp0include\common.bat %2
"%CEL_CONEMU_PATH%" -reuse -run cmd.exe /k ""%CEL_CONEMU_INIT_SCRIPT%" && "%1"" -new_console:%CEL_SPLIT_ARG%:a:P:"%CEL_CONEMU_ADMIN_PALETTE%"