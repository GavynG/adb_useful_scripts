@echo off
title ���ݷ����������ļ�  by MIUI��̳_ǳ���ĵ�
mode con lines=28 cols=64
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
ECHO. ���ݷ����������ļ�  by MIUI��̳_ǳ���ĵ�
ECHO.
ECHO. �ֻ��迪��USB���Բ���������ӣ���ȷ��װ��adb�����������Ȱ�װС�����֣�
ECHO.
echo  �ر��������������(�����������������������)
ECHO. ==============================================================
ECHO.
PAUSE
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
cls
ECHO.
ECHO  �����·�������Ҫ���ݷ���������������磺mmcblk0p7
ECHO  Ȼ����������ļ���(����.img)���磺aboot Ȼ��س�����
ECHO.
set mmc=
set /p mmc= ��д���������:
echo.
set bac=
set /p bac= ��������ļ���:
ECHO. 
ECHO  ==============================================================
ECHO    ��ʼ���ֻ����Ʒ������������ݵ� sdcard
echo.
echo    �ڷָ����·��Ƿ񿴼� ���� ������ʾ,
echo.
echo    1024+0 records in
echo    1024+0 records out
echo    4194304 bytes transferred in 0.218 secs ^<19239926 bytes/sec^>
echo. 
echo    �������������ʾ��֤�����Ƴɹ����������������
echo.
ECHO ===============================================================
echo.
echo.
adb shell su -c "dd if=/dev/block/%mmc% of=/sdcard/%bac%.img bs=4096"
ECHO.
pause >nul
cls
ECHO. 
echo  ����ѷ��������ļ����浽�����ϣ�������Ҫ����Ĵ���(����ĸ)�����磺D
echo.
set back=
set /p back= ���浽:
cls
echo.
ECHO. ==============================================================
echo.
echo    �ڷָ����·��Ƿ񿴼� ���� ������ʾ,
echo.
echo    2573 KB/s ^<4194304 bytes in 2.146s^>
echo    ����
echo    [100%] /sdcard/xxxxxx.img
echo.
echo    �������������ʾ��֤�������ɹ����������������
echo.
ECHO. ==============================================================
echo.
echo.
adb pull /sdcard/%bac%.img %back%:/
pause >nul
cls
ECHO. ===========================================================
ECHO.
echo ���� %back%:/ �·����ļ����ɣ����������3����Զ��˳�
ECHO.
ECHO. ===========================================================
ping 127.0.0.1 /n 4 >nul
start %back%:/
exit 