@echo off
setlocal
cd /d "%~dp0"
title QuantDesk - NSE Options Trading Desk
echo Starting QuantDesk...

set JAVA_CMD=javaw
where %JAVA_CMD% >nul 2>&1
if %ERRORLEVEL% neq 0 (
    if defined JAVA_HOME (
        set JAVA_CMD="%JAVA_HOME%\bin\javaw.exe"
    ) else (
        set JAVA_CMD=java
    )
)

start "" %JAVA_CMD% -Dfile.encoding=UTF-8 --enable-native-access=ALL-UNNAMED -Xmx2048m -jar target\quantdesk-options.jar %*
