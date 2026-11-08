@echo off
REM Builds all three OilMitra browser apps with Google Maps and copies them into
REM backend\webapp (supplier /app/), backend\admin_webapp (operator /admin/) and
REM backend\portal_webapp (myOilMitra /portal/).
REM Run this before deploy\make_live.bat whenever Flutter screens changed.
setlocal
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0..\mobile\build_web.ps1"
if errorlevel 1 (
  echo Web build failed.
  pause
  exit /b 1
)
echo.
echo Done. Run deploy\make_live.bat to refresh the live repositories.
pause
