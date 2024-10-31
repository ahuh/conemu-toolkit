@echo off
call %~dp0include\common.bat %1
"%CEL_CONEMU_PATH%" -reuse -run cmd.exe /c "cleanmgr /lowdisk /dC" -new_console:%CEL_SPLIT_ARG%:n:a:P:"%CEL_CONEMU_ADMIN_PALETTE%":t:"Disk Cleaner"