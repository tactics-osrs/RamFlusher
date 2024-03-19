TITLE Ram Flusher
@echo off
setlocal enabledelayedexpansion
color 0A

:Start
cls
REM The 'powershell -Command "Get-Date"' command displays the current date and time.
powershell -Command "Get-Date"

echo Please select an option:
echo 1. Flush DNS
echo 2. Reset IP/WINSOCK Catalog
echo 3. Task Kill
echo 4. Exit
echo.

REM Code to take user input to choose what command to execute...
set "choice="
set /p choice=Enter your choice: 

REM Check if the input is a number between 1 and 4.
echo.!choice!|findstr /r /c:"^[1-4]$" >nul || (
    echo Invalid input! Please enter a number between 1 and 4.
    pause
    goto Start
)


REM Flush DNS Code...
if "!choice!"=="1" (
echo Flushing DNS...
ipconfig /flushdns
echo DNS Flush Completed.
pause
goto Start
)

REM Reset IP Configuration/Winsock Catalog Code...
if "!choice!"=="2" (
echo Resetting IP Configuration...
netsh int ip reset
echo Resetting Winsock Catalog...
netsh winsock reset
echo Reset Completed.
pause
goto Start
)

if "%choice%"=="3" (
    call :KillOnDemand
    goto Start
)



REM Code for exiting...
if "!choice!"=="4" (
    echo Are you sure you want to exit? ^(Y/N^)
    set /p confirm=
    if /i "!confirm!"=="Y" (
        echo Exiting...
        timeout /t 1 /nobreak >nul
        exit /b
    )
)

:KillOnDemand
echo Listing all tasks with service information:
TASKLIST /svc
set /p Input="Please enter the PID or image name of the application you want to close: "
if "%Input%"=="" goto NoInput
TASKKILL /PID %Input% /F 2>nul
IF ERRORLEVEL 1 (
    TASKKILL /IM %Input% /F 2>nul
    IF ERRORLEVEL 1 (
        echo Error: Invalid PID or image name entered. Task with PID or image name %Input% does not exist.
        pause
        goto :KillOnDemand
    ) ELSE (
        echo Task with image name %Input% has been terminated.
        set Input=
    )
) ELSE (
    echo Task with PID %Input% has been terminated.
    set Input=
)
pause
goto :KillOnDemand

:NoInput
echo Error: No input provided. Please enter a PID or image name.
pause
goto :KillOnDemand
