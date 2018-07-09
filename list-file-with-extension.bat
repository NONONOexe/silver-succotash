@echo off
setlocal enabledelayedexpansion

set ext=%1
set ret=list-file-with-extension.txt

type nul > %ret%
for /r %%i in (*) do (
    if !ext!==%%~xi (
        echo %%i >> %ret%
    )
)

rem debug
rem type list-file-with-extension.txt
