@echo off
TITLE FASTBOOT����Recovery����
color 3f
echo.
ECHO. =================================================
echo.
echo     �㼴���������recovery���Ļָ�ϵͳ
echo.
echo.
echo     --������뵼��recovery��رմ˴��ڣ�
echo.
echo     --�������������
echo.
ECHO. =================================================
pause >nul
CLS
ECHO. =================================================
echo.
echo   �����������������fastbootģʽ��
echo.
echo.    1.��������Ҫ��װ�ٷ���USB���������ر��ֻ�
echo.
echo.    2.ͬʱ��ס������+����������
echo       ��ס����ֱ����ʾ���û��������
echo.
echo     3.��Ļ��ʼ��ͣ��������LOGO����
echo.
echo.    4.����������裬���ֻ����ӵ�����,�����������
echo.
echo     --������뵼��recovery��رմ˴��ڣ�
echo.
ECHO. =================================================
pause >nul
COLOR CF
CLS
ECHO. =================================================
echo.
echo.
echo    �Ƿ񿴼�������ʾ��
echo.
echo.
echo         xxxxxx fastboot
echo.
echo.
echo    �������������ʾ��֤���ֻ�������������������������ʽ��ʼ����
echo.
echo    ������رմ˴��ڣ�����������Ƿ���ȷ��װ���ֻ��Ƿ���ȷ����
echo.
echo    ����recoveryʱ����һ����֤�ֻ��͵��Ե���������
echo.
ECHO. =================================================
echo.
echo.
fastboot.exe devices
pause >nul
CLS
ECHO. =================================================
echo.
echo.
echo    �Ƿ񿴼� ���� ������ʾ
echo.
echo.
echo.   sending 'recovery' (13526 KB)...
echo.   OKAY [  0.840s]	
echo.   writing 'recovery'...
echo.   OKAY [  1.615s]
echo.   finished. total time: 2.455s
echo.
echo    �������������ʾ�����������ʽ��ʼ����
ECHO. =================================================
echo.
echo.
fastboot.exe flash recovery mi_recovery.img
pause >nul
CLS
ECHO. =================================================
echo.
echo.
echo    �Ƿ񿴼� ���� ������ʾ,
echo.
echo.   downloading 'boot.img'...
echo.   OKAY [  0.838s]
echo.   booting...
echo.   OKAY [  0.025s]
echo.   finished. total time: 0.864s
echo.
echo    �������������ʾ��֤������ɹ��������������
echo.
echo    ��ʱǧ��Ҫ�رմ˴���
echo.
echo.
ECHO. =================================================
echo.
echo.
fastboot.exe boot mi_recovery.img
pause >nul
CLS
ECHO. =================================================
echo.
echo.
echo    ��ϲ��ɹ�������recovery����
echo.
echo    �����Ե�Ƭ�̣��ֻ����Զ���������������رմ˴���
echo.
echo.
ECHO. =================================================
echo.
echo.
pause >nul
