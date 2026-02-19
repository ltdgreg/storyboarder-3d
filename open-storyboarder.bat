@echo off
setlocal

cd /d "%~dp0"
set "ELECTRON_RUN_AS_NODE="
set "STORYBOARDER_SKIP_DEVTOOLS=1"
set "NODE_NO_WARNINGS=1"

if not exist "node_modules" (
  echo Installing dependencies...
  call npm install --ignore-scripts
  if errorlevel 1 goto :error

  call node node_modules\electron\install.js
  if errorlevel 1 goto :error
)

if not exist "node_modules\electron\dist\electron.exe" (
  echo Installing Electron binary...
  call node node_modules\electron\install.js
  if errorlevel 1 goto :error
)

if not exist "src\build\shot-generator.js" (
  echo Building app bundles on first run...
  call cmd /c "set NODE_OPTIONS=--openssl-legacy-provider&& npm run build"
  if errorlevel 1 goto :error
)

echo Starting Storyboarder...
call npm run start:electron
goto :eof

:error
echo.
echo Setup failed. Check the output above for details.
pause
exit /b 1
