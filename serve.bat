@echo off
set PORT=3000

for /f "tokens=2 delims=:" %%a in ('ipconfig ^| findstr /i "IPv4"') do set IP=%%a
set IP=%IP: =%

echo.
echo  Stow Web - static server started
echo  ---------------------------------
echo  Local:   http://localhost:%PORT%
echo  LAN:     http://%IP%:%PORT%
echo.
echo  Press Ctrl+C to stop
echo.

python -m http.server %PORT% --bind 0.0.0.0

