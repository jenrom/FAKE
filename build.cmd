@echo off

cls

paket.bootstrapper.exe
if errorlevel 1 (
  exit /b %errorlevel%
)

paket.exe install -v
if errorlevel 1 (
  exit /b %errorlevel%
)

SET TARGET="Default"

IF NOT [%1]==[] (set TARGET="%1")

"packages\FAKE\tools\Fake.exe" "build.fsx" "target=%TARGET%"