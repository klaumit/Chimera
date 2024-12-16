@echo off

set TCDIR=%~dp0Compilers\SHC
set CVDIR=%~dp0Targets\PV3S1600

set PATH=%TCDIR%\bin;%CVDIR%\TOOLS;%PATH%
set SHC_INC=%TCDIR%\include
set SHC_LIB=%TCDIR%\bin
set SHC_TMP=%TCDIR%

mkdir Debug
mkdir Release
mkdir user_bin


