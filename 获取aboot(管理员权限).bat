@echo off
title ��ȡaboot.img  by MIUI��̳_ǳ���ĵ�
mode con lines=28 cols=64
color 8f
Rem �����ļ�·��
echo. 
echo ������л���ing���� ���Ժ�
ping 127.0.0.1 /n 2 /w 1200 >nul
echo.
set TempFile_Name=%SystemRoot%\System32\BatTestUACin_SysRt%Random%.batemp
echo %TempFile_Name%

Rem д���ļ�
( echo "BAT Test UAC in Temp" >%TempFile_Name% ) 1>nul 2>nul
 
Rem �ж�д���Ƿ�ɹ�
if exist %TempFile_Name% (
color af
echo.
echo �����Թ���Ա������е�ǰ����������������һ��
ping 127.0.0.1 /n 3 >nul
goto A
) else (
color cf
echo.
echo ���ʧ�ܣ�û���Թ���Ա������е�ǰ������
echo.
echo �밴������˳�,Ȼ�� �Ҽ�-�Թ���Ա�������
)
pause >nul
exit

:A
Rem ɾ����ʱ�ļ�
del %TempFile_Name% 1>nul 2>nul
CLS
color 3f
mode con lines=36 cols=80
cd /d %~dp0
ECHO. ==============================================================
ECHO. ��ȡaboot.img  by MIUI��̳_ǳ���ĵ�
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
ECHO  �����·�����aboot����������������磺mmcblk0p7
ECHO  Ȼ��س�����
ECHO.
set mmc=
set /p mmc= ���������:
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
adb shell su -c "dd if=/dev/block/%mmc% of=/sdcard/aboot.img bs=4096"
ECHO.
pause >nul
cls
ECHO. 
echo  ����� aboot.img �ļ����浽�����ϣ�������Ҫ����Ĵ���(����ĸ)�����磺D
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
echo    [100%] /sdcard/aboot.img
echo.
echo    �������������ʾ��֤�������ɹ����������������
echo.
ECHO. ==============================================================
echo.
echo.
adb pull /sdcard/aboot.img %back%:/
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