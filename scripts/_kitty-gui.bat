@echo off
call %~dp0include\common.bat %1
@REM WARNING - Use direct path to kitty.exe (not to the choco shim) to enable console integration in ConEmu
"%CEL_CONEMU_PATH%" -reuse -run "%CEL_KITTY_PATH%" -new_console:%CEL_SPLIT_ARG%