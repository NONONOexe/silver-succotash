rem ファイルの数が0のディレクトリを削除します。
rem author: keisuke ando
rem since : 2018/07/08
@echo off
setlocal enabledelayedexpansion

for /d %%i in (*) do (
    call :count_files "%%i"
    set file_num=!errorlevel!
    if !file_num! equ 0 (
        echo 空のフォルダを削除します: %%i
        rmdir /s /q "%%i"
    )
)
exit /b

rem サブディレクトリを含む%1に含まれるファイルの数を返します。
rem %1: フォルダのパス
: count_files
set /a counter=0
for /r %1 %%i in (*) do (
    if exist %%i (
        set /a counter=!counter!+1
    )
)
exit /b %counter%
