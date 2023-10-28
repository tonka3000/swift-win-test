@echo off
set SWIFT_EXE=C:\\Library\\Developer\\Toolchains\\unknown-Asserts-development.xctoolchain\\usr\\bin\\swift.exe
set MT_EXE=mt
rem set MT_EXE=C:\Program Files (x86)\Windows Kits\10\bin\10.0.19041.0\x64\mt.exe
call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Professional\VC\Auxiliary\Build\vcvars64.bat"
set CONFIG=%1

if "%CONFIG%"=="" ( set CONFIG=debug )

call "%SWIFT_EXE%" build --product MyApp -c %CONFIG%

call "%MT_EXE%" -nologo -manifest MyApp\MyApp.exe.manifest -outputresource:.build\x86_64-unknown-windows-msvc\%config%\MyApp.exe
copy MyApp\Info.plist .build\x86_64-unknown-windows-msvc\%config%\