@ECHO OFF
TITLE С�� ˢ��CWM recovery���� by cofface
color 3f

:MENU
CLS
ECHO. =================================================
ECHO. ����֧��:www.cofface.com
ECHO. 
ECHO. =================================================
ECHO.
ECHO.   ��Ҫ��ʲô����?
ECHO.
ECHO.   1��ˢ��recovery ����ҪROOTȨ�ޡ�
ECHO.   2������recoveryģʽ
ECHO.
ECHO.
ECHO. =================================================
ECHO.

:CHO
set choice=
set /p choice= ѡ����Ҫ���еĲ���:
IF NOT "%Choice%"=="" SET Choice=%Choice:~0,1%
if /i "%choice%"=="1" goto FLASHRECOVERY
if /i "%choice%"=="2" goto RECOVERYEND
echo ѡ����Ч������������
echo.
goto MENU

:FLASHRECOVERY
CLS
COLOR E0
ECHO. =================================================
echo.
echo   ���ڵȴ�����ֻ���ȷ���ӵ�����
echo.
echo     --����ȷ��װ������
echo.
echo     --��ROOT������
echo.
echo     --���ֻ��Ͽ���USB���ԡ�����-������Աѡ��-��ѡUSB���ԡ�
echo.
echo     --Ȼ���ֻ�ͨ��USB�������ӵ�����
echo     
echo     ��ܰ��ʾ�������ˢ��ʧ��һ������Ϊ������������ֵ���
echo.   ����360����/QQ�ܼ�/�㶹�Եȣ����������Ǻ��ٳ��ԡ�
ECHO. =================================================
adb.exe wait-for-device >NUL 2>NUL
CLS
COLOR E0
echo ***************************************************************************
echo *                                                                         *
echo *                                                                         *
echo *                   �ֻ�����ˢ��Recovery......                            *
echo *                   �뱣���ֻ�ͨ��USB�����ӵ�����                         *
echo *                   �����ʱ���޷�Ӧ����رմ˴��ں�����                  *
echo *                                                                         *
echo *                                                                         *
echo ***************************************************************************
adb.exe push cofface_mi4w_recovery_v1.0.img /data/local/tmp/recovery.img
adb.exe push busybox /data/local/tmp/busybox
adb.exe shell chmod 777 /data/local/tmp/busybox
adb shell su -c "/data/local/tmp/busybox mount -o remount,rw /system"
adb shell su -c "rm /system/etc/install-recovery.sh"
adb shell su -c "rm /system/recovery-from-boot.p"
adb.exe shell su -c "/data/local/tmp/busybox dd if=/data/local/tmp/recovery.img of=/dev/block/platform/msm_sdcc.1/by-name/recovery"
adb.exe shell su -c "rm -r /data/local/tmp/recovery.img"
goto RECOVERYEND

:RECOVERYEND
CLS
COLOR E0
echo ***************************************************************************
echo *                                                                         *
echo *                                                                         *
echo *                   �ֻ����ڽ���recoveryģʽ......                        *
echo *                   �뱣���ֻ�ͨ��USB�����ӵ�����                         *
echo *                   �����ʱ���޷�Ӧ����رմ˴��ں�����                  *
echo *                                                                         *
echo *                                                                         *
echo ***************************************************************************
adb.exe wait-for-device >NUL 2>NUL
adb.exe reboot recovery
pause >nul
CLS

:END
EXIT
