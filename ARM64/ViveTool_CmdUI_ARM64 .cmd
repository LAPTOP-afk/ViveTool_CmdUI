@echo off
color 3f
mode con cols=80 lines=35
setlocal
title ViveTool_CmdUI_v1.0_ARM64 

:: 检查是否以管理员身份运行
openfiles >nul 2>&1
if %errorlevel% neq 0 (
    echo 正在以管理员权限运行...
    powershell -Command "Start-Process '%~f0' -Verb runAs"
    exit /b
)

:ShowMenu
cls
ECHO. 
ECHO. 【ViveTool_CmdUI_v1.0_ARM64 】 
ECHO.  
ECHO. ==========================================================
ECHO. 注意：操作完成后，请重启电脑，以便设置生效！
ECHO. ==========================================================
ECHO. 
ECHO.       请选择要进行的操作?
ECHO.
ECHO.           1.√启用功能
ECHO.
ECHO.           2.×禁用功能
ECHO.    
ECHO.           3.打开Github项目主页
ECHO.
ECHO.           0.完成退出
ECHO.
ECHO. ==========================================================
echo.
echo.
:CHO
set choice=
set /p choice= 请输入对应数字，然后按回车键：
echo.

if '%choice%'=='1' goto EnableFeature
if '%choice%'=='2' goto DisableFeature
if '%choice%'=='3' goto Home
if '%choice%'=='0' goto Exit

echo 无效的选项，请输入 1、2 、3 或 0。
timeout /t 3
goto ShowMenu

:EnableFeature
cls
cd /d %~dp0\ViveTool
echo.
echo. ▲ 请输入要【√启用】的功能ID，然后按回车键
echo. (多个ID请用英文逗号","隔开,例如“123456,999888”)
set /p id= 在此输入：
echo ViveTool /enable /id:%id%
echo.
ViveTool /enable /id:%id%
echo 功能已启用，请重启电脑确保生效。
timeout /t 10
cd /d %~dp0
goto ShowMenu

:DisableFeature
cls
cd /d %~dp0\ViveTool
echo.
echo. ▲ 请输入要【×禁用】的功能ID，然后按回车键
echo. (多个ID请用英文逗号","隔开,例如“123456,999888”)
set /p id= 在此输入：
echo ViveTool /disable /id:%id%
echo.
ViveTool /disable /id:%id%
echo 功能已禁用，请重启电脑确保生效。
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