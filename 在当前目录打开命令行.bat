@echo off
color 8f
mode con lines=30 cols=68
title �ڵ�ǰĿ¼��������(As ����Ա���)
REM ________________________________________________________________

>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

if '%errorlevel%' NEQ '0' (

    echo �������ԱȨ��...

    goto UACPrompt

) else ( goto gotAdmin )

:UACPrompt

    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"

    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
exit /B

:gotAdmin

    if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
    pushd "%CD%"
    CD /D "%~dp0"
	goto A

REM ________________________________________________________________



:A
Rem ɾ����ʱ�ļ�
del %TempFile_Name% 1>nul 2>nul
CLS
start cmd.exe|cd /d %~dp0