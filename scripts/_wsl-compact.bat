@echo off
call %~dp0include\common.bat %1

if "%CEL_TERM_CLIENT%"=="CONEMU" (
    "%CEL_CONEMU_PATH%" -reuse -run pwsh.exe -c "wslcompact -c -y %CEL_WSL_DISTRIB%" -new_console:%CEL_SPLIT_ARG%:c:P:"%CEL_CONEMU_PWSH_PALETTE%":t:"WSL Compact"
) else if "%CEL_TERM_CLIENT%"=="WT" (
    wt %CEL_SPLIT_ARG% -p "%CEL_WT_PWSH_PROFILE%" --title "WSL Compact" --appendCommandLine %~dp0subscripts\wsl-compact.ps1 %CEL_WSL_DISTRIB%
)