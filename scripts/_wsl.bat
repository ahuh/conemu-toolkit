@echo off
call %~dp0include\common.bat %1
"%CEL_CONEMU_PATH%" -reuse -run "%CEL_WSL_PATH%" -new_console:%CEL_SPLIT_ARG%:P:"%CEL_CONEMU_WSL_PALETTE%":pm:/mnt