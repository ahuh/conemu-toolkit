@echo off
call %~dp0include\common.bat
taskkill /fi "ImageName eq %CEL_TINYWALL_EXE%" /fi "Session ne 0" /f
tasklist /nh /fi "ImageName eq %CEL_TINYWALL_EXE%" /fi "Session ne 0" /fi "MemUsage lt 10000" | find /i "%CEL_TINYWALL_EXE%" > null || (start /d "%CEL_TINYWALL_DIR%" %CEL_TINYWALL_EXE%)