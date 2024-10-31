@echo off

@REM Initialize config script if necessary, load it
IF NOT EXIST "%~dp0config.bat" (
  copy "%~dp0config.default.bat" "%~dp0config.bat" >NUL 2>&1
)
call %~dp0config.bat

@REM Handle split argument
if "%1"=="" (
    set "CEL_SPLIT_ARG="
) else if "%1"=="+" (
    set "CEL_SPLIT_ARG=sH"
) else if "%1"=="-" (
    set "CEL_SPLIT_ARG=sV"
)