@echo off
call %~dp0include\common.bat %1
"%CEL_CONEMU_PATH%" -reuse -run cmd.exe /k "%CEL_CONEMU_INIT_SCRIPT%" -new_console:%CEL_SPLIT_ARG%:a:P:"%CEL_CONEMU_ADMIN_PALETTE%"