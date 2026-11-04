@echo off
REM Builds both OilMitra browser apps and copies them into backend\.
REM Run this before deploy\make_live.bat whenever Flutter screens changed.
cd /d "%~dp0..\mobile"
set "PUB_CACHE=%~dp0..\.pub-cache"

where flutter >nul 2>nul
if errorlevel 1 (
  echo Flutter is not on PATH. Using the last builds in backend\webapp and backend\admin_webapp.
  if not exist "%~dp0..\backend\webapp\index.html" (
    echo No supplier build found. Install Flutter first.
    pause
    exit /b 1
  )
  goto done
)

echo Building the supplier app...
call flutter pub get
call flutter build web --base-href /app/
if errorlevel 1 (
  echo Supplier build failed.
  pause
  exit /b 1
)
if exist "%~dp0..\backend\webapp" rmdir /s /q "%~dp0..\backend\webapp"
xcopy /e /i /q "build\web" "%~dp0..\backend\webapp" >nul

echo Building the operator console...
call flutter build web --target lib/main_admin.dart --base-href /admin/ --output build/admin_web
if errorlevel 1 (
  echo Operator build failed.
  pause
  exit /b 1
)
if exist "%~dp0..\backend\admin_webapp" rmdir /s /q "%~dp0..\backend\admin_webapp"
xcopy /e /i /q "build\admin_web" "%~dp0..\backend\admin_webapp" >nul

:done
echo.
echo Done. Run deploy\make_live.bat to refresh live\oilmitra and live\oilmitra-operator.
pause
