@echo off
call %~dp0include\common.bat %1
"%CEL_CONEMU_PATH%" -reuse -run cmd.exe /c "choco-cleaner" -new_console:%CEL_SPLIT_ARG%:c:a:P:"%CEL_CONEMU_ADMIN_PALETTE%":t:"Choco Cleaner"