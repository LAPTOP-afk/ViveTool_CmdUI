@echo off
color 3f
mode con cols=80 lines=35
setlocal
title ViveTool_CmdUI_v1.0_ARM64 

:: ����Ƿ��Թ���Ա�������
openfiles >nul 2>&1
if %errorlevel% neq 0 (
    echo �����Թ���ԱȨ������...
    powershell -Command "Start-Process '%~f0' -Verb runAs"
    exit /b
)

:ShowMenu
cls
ECHO. 
ECHO. ��ViveTool_CmdUI_v1.0_ARM64 �� 
ECHO.  
ECHO. ==========================================================
ECHO. ע�⣺������ɺ����������ԣ��Ա�������Ч��
ECHO. ==========================================================
ECHO. 
ECHO.       ��ѡ��Ҫ���еĲ���?
ECHO.
ECHO.           1.�����ù���
ECHO.
ECHO.           2.�����ù���
ECHO.    
ECHO.           3.��Github��Ŀ��ҳ
ECHO.
ECHO.           0.����˳�
ECHO.
ECHO. ==========================================================
echo.
echo.
:CHO
set choice=
set /p choice= �������Ӧ���֣�Ȼ�󰴻س�����
echo.

if '%choice%'=='1' goto EnableFeature
if '%choice%'=='2' goto DisableFeature
if '%choice%'=='3' goto Home
if '%choice%'=='0' goto Exit

echo ��Ч��ѡ������� 1��2 ��3 �� 0��
timeout /t 3
goto ShowMenu

:EnableFeature
cls
cd /d %~dp0\ViveTool
echo.
echo. �� ������Ҫ�������á��Ĺ���ID��Ȼ�󰴻س���
echo. (���ID����Ӣ�Ķ���","����,���硰123456,999888��)
set /p id= �ڴ����룺
echo ViveTool /enable /id:%id%
echo.
ViveTool /enable /id:%id%
echo ���������ã�����������ȷ����Ч��
timeout /t 10
cd /d %~dp0
goto ShowMenu

:DisableFeature
cls
cd /d %~dp0\ViveTool
echo.
echo. �� ������Ҫ�������á��Ĺ���ID��Ȼ�󰴻س���
echo. (���ID����Ӣ�Ķ���","����,���硰123456,999888��)
set /p id= �ڴ����룺
echo ViveTool /disable /id:%id%
echo.
ViveTool /disable /id:%id%
echo �����ѽ��ã�����������ȷ����Ч��
timeout /t 10
cd /d %~dp0
goto ShowMenu

:Home
START https://github.com/LAPTOP-afk/ViveTool_CmdUI
pause
GOTO ShowMenu

:Exit
if defined original_path (
    set "path=%original_path%"
)
exit