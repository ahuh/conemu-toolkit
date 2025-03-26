@echo off
call %~dp0include\common.bat %1
"%CEL_CONEMU_PATH%" -reuse -run powershell.exe -c "Install-Script Update-InboxApp -Scope CurrentUser" -new_console:%CEL_SPLIT_ARG%:c:P:"%CEL_CONEMU_PWSH_PALETTE%":t:"Microsoft Store Apps Init (run once)"