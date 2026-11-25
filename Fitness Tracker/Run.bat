@echo off
setlocal
cd /d "%~dp0"

echo Fitness Tracker
 echo.

where py >nul 2>nul
if %errorlevel%==0 (
    set "PY=py -3"
) else (
    where python >nul 2>nul
    if errorlevel 1 (
        echo Python 3 was not found. Install Python 3.10 or newer from python.org and enable "Add Python to PATH".
        pause
        exit /b 1
    )
    set "PY=python"
)

if not exist ".venv\Scripts\python.exe" (
    echo Creating a private Python environment...
    %PY% -m venv .venv
    if errorlevel 1 goto :error
)

 echo Installing or checking required packages...
".venv\Scripts\python.exe" -m pip install -r "fitness_tracker\requirements.txt"
if errorlevel 1 goto :error

start "" powershell -NoProfile -WindowStyle Hidden -Command "$u='http://127.0.0.1:5001'; for($i=0;$i -lt 30;$i++){try{$r=Invoke-WebRequest -UseBasicParsing -Uri $u -TimeoutSec 2; if($r.StatusCode -ge 200){Start-Process $u; exit}}catch{}; Start-Sleep -Seconds 1}"

echo.
echo Starting the app. Keep this window open while using it.
echo Open http://127.0.0.1:5001 if your browser does not open.
echo Press Ctrl+C here to stop.
echo.
".venv\Scripts\python.exe" run.py
if errorlevel 1 goto :error
exit /b 0

:error
echo.
echo The app could not start. Check the message above and the setup instructions in README.md.
pause
exit /b 1

