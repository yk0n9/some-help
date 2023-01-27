@echo off
for /f "tokens=1,2,* " %%i in ('REG QUERY "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable ^| find /i "ProxyEnable"') do (set /A ProxyEnableValue=%%k)

if %ProxyEnableValue% equ 0 (
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 1 /f >nul
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer /d "127.0.0.1:7890" /f >nul

    echo System Proxy ON
    
) else if %ProxyEnableValue% equ 1 (
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 0 /f >nul

    echo System Proxy OFF
)

ping 127.1 -n 3 >nul

exit
