rem �t�@�C���̐���0�̃f�B���N�g�����폜���܂��B
rem author: keisuke ando
rem since : 2018/07/08
@echo off
setlocal enabledelayedexpansion

for /d %%i in (*) do (
    call :count_files "%%i"
    set file_num=!errorlevel!
    if !file_num! equ 0 (
        echo ��̃t�H���_���폜���܂�: %%i
        rmdir /s /q "%%i"
    )
)
exit /b

rem �T�u�f�B���N�g�����܂�%1�Ɋ܂܂��t�@�C���̐���Ԃ��܂��B
rem %1: �t�H���_�̃p�X
: count_files
set /a counter=0
for /r %1 %%i in (*) do (
    if exist %%i (
        set /a counter=!counter!+1
    )
)
exit /b %counter%
