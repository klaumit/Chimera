@echo off

set TZ=JST-9

set LSDIR=%~dp0Compilers\LSIC
set CSDIR=%~dp0Targets\PV2EN03

set PATH=%LSDIR%bin;%CSDIR%\TOOL;%PATH%
set LSC_INC=%LSDIR%\include
set LSC_LIB=%LSDIR%\lib
set MAKEDEFAULT=%LSDIR%\bin\makedef

set PVDIR=%CSDIR%\C

mkdir obj
mkdir ForDEBUG
mkdir ..\User_Bin
mkdir ..\Bin
