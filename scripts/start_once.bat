@echo off

SET HELP_MODE=
IF "%~1"=="" SET HELP_MODE=1
IF "%~1"=="-h" SET HELP_MODE=1
IF "%~1"=="--help" SET HELP_MODE=1
IF "%~1"=="/?" SET HELP_MODE=1

SET TASK_PROGRAM_NAME=%~1
SET TARGET_PATH=%~2
SET OTHER_ARGS=%3 %4 %5 %6 %7 %8 %9 

IF "%HELP_MODE%"=="1" (
    echo Start a program only if not already running.
    echo.
    echo Help:  start_once ^(^-h ^| --help ^| /?^)
    echo Usage: start_once TASK_PROGRAM_NAME TARGET_PATH [OTHER_ARGS]...
    echo.
    echo TASK_PROGRAM_NAME      Name of the program to check in task manager.
    echo TARGET_PATH            Path to the program file to start, or program file name only.
    echo [OTHER_ARGS]           Other optional args to pass to the program file to start.
    EXIT /B 0
) ELSE (
IF "%TARGET_PATH%"=="" (
    echo Missing second argument value: TARGET_PATH
    EXIT /B 1
) ELSE (
    tasklist /nh /fi "imagename eq %TASK_PROGRAM_NAME%" /fo csv | find /i "%TASK_PROGRAM_NAME%" > nul || ((start "" "%TARGET_PATH%" %OTHER_ARGS%) && true)
)
)