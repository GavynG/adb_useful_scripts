@echo off
title ����adb����
mode con lines=30 cols=68
color 8f
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
color 3f
mode con lines=36 cols=80
cd /d %~dp0
ECHO. ==============================================================
ECHO. ����adb����
ECHO.
ECHO. �����������
ECHO. ==============================================================
ECHO.
PAUSE>NUL
cls
ECHO. ====================================================
ECHO.
ECHO. ���ڳ�������ADB����~
ECHO.
ECHO. ====================================================
ECHO.
netstat -ano |findstr "5037"
echo.
set pid=
set /p pid= ����LISTENING ���������(û�оͿ���),Ȼ���س�:
if /i "%pid%"=="" goto T
tasklist|findstr "%pid%"
echo.
taskkill /f /pid %pid%&&goto T||echo.
echo ��������ʧ�ܣ���������������ֶ��������������������
echo �������ڡ�%pid%����ǰ��,һ��Ϊ�ֻ�������&pause >nul

:T
echo.
taskkill /f /im adb.exe
adb kill-server
adb start-server
ping 127.0.0.1 /n 3 >nul
cls
ECHO.
ECHO  ==============================================================
ECHO.
echo ����������ϣ���ȷ���·��豸�б���������豸�����������������
ECHO.
ECHO  ==============================================================
ECHO.
echo �豸�б�
adb devices
echo.
PAUSE >nul
