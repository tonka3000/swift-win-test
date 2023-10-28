@echo off
set SWIFT_EXE=C:\\Library\\Developer\\Toolchains\\unknown-Asserts-development.xctoolchain\\usr\\bin\\swift.exe
set MT_EXE=mt
rem set MT_EXE=C:\Program Files (x86)\Windows Kits\10\bin\10.0.19041.0\x64\mt.exe
set CONFIG=%1
set PRODUCT=SimpleApp

where mt
if ERRORLEVEL 1 (
  call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Professional\VC\Auxiliary\Build\vcvars64.bat"
)

if "%CONFIG%"=="" ( set CONFIG=debug)

call "%SWIFT_EXE%" build --product %PRODUCT% -c %CONFIG%
if %ERRORLEVEL% NEQ 0 goto end

call "%MT_EXE%" -nologo -manifest %PRODUCT%\%PRODUCT%.exe.manifest -outputresource:.build\x86_64-unknown-windows-msvc\%config%\%PRODUCT%.exe
copy %PRODUCT%\Info.plist .build\x86_64-unknown-windows-msvc\%config%\

:end