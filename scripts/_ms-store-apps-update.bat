@echo off
call %~dp0include\common.bat %1

if "%CEL_TERM_CLIENT%"=="CONEMU" (
    "%CEL_CONEMU_PATH%" -reuse -run powershell.exe -c "Get-AppxPackage | Update-InboxApp" -new_console:%CEL_SPLIT_ARG%:a:c:P:"%CEL_CONEMU_PWSH_PALETTE%":t:"Microsoft Store Apps Update"
)