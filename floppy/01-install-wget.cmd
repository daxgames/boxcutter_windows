@setlocal EnableDelayedExpansion EnableExtensions
@for %%i in (%~dp0\_packer_config*.cmd) do @call "%%~i"
@if defined PACKER_DEBUG (@echo on) else (@echo off)

echo on

title Installing wget. Please wait...

if not defined WGET_URL set WGET_URL=https://eternallybored.org/misc/wget/current/wget.exe

for %%i in ("%WGET_URL%") do set filename=%SystemRoot%\%%~nxi

copy /y "%~dp0\_download.cmd" "%SystemRoot%\"

call "%~dp0\_download.cmd" "%WGET_URL%" "%filename%"

if defined DISABLE_BITS (
    if "%DISABLE_BITS%" == "1" if not exist "%filename%" goto exit1
)

goto exit1

:exit0

ver>nul

goto :exit

:exit1

verify other 2>nul

:exit
