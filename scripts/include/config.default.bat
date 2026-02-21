@echo off

@REM # Select the terminal client for integration: CONEMU or WT
set "CEL_TERM_CLIENT=CONEMU"
@REM set "CEL_TERM_CLIENT=WT"

@REM # Configuration for CONEMU
set "CEL_CONEMU_DIR=%ProgramFiles%\ConEmu"
set "CEL_CONEMU_PATH=%CEL_CONEMU_DIR%\ConEmu64.exe"
set "CEL_CONEMU_INIT_SCRIPT=%CEL_CONEMU_DIR%\ConEmu\CmdInit.cmd"
set "CEL_CONEMU_ADMIN_PALETTE=^<ahuh-admin^>"
set "CEL_CONEMU_PWSH_PALETTE=^<ahuh-pwsh^>"
set "CEL_CONEMU_WSL_PALETTE=^<ahuh-wsl^>"

@REM # Configuration for WT
set "CEL_WT_PATH=wt"
set "CEL_WT_CMD_PROFILE=cmd"
set "CEL_WT_CMD_ADMIN_PROFILE=cmd-admin"
set "CEL_WT_PWSH_PROFILE=pwsh"
set "CEL_WT_PWSH_ADMIN_PROFILE=pwsh-admin"
set "CEL_WT_WSL_PROFILE=wsl"

@REM # Common configuration
set "CEL_KITTY_PATH=%ProgramData%\chocolatey\lib\kitty\tools\kitty.exe"
set "CEL_WSL_PATH=%windir%\system32\wsl.exe"
set "CEL_TINYWALL_DIR=%ProgramFiles(x86)%\TinyWall"
set "CEL_TINYWALL_EXE=TinyWall.exe"
set "CEL_WSL_DISTRIB=Ubuntu"