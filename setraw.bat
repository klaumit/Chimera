@echo off

set LSDIR=%~dp0Compilers\LSIC
set CSDIR=%~dp0Targets\PV2EN03
set LSC_INC=%LSDIR%\include
set LSC_LIB=%LSDIR%\lib
set MAKEDEFAULT=%LSDIR%\bin\makedef
set LSBIN=%LSDIR%\bin

set LSTOO=%CSDIR%\TOOL
set PVDIR=%CSDIR%\C

set TCDIR=%~dp0Compilers\SHC
set CVDIR=%~dp0Targets\PV3S1600
set SHC_INC=%TCDIR%\include
set SHC_LIB=%TCDIR%\bin
set SHC_TMP=%TCDIR%

set TCBIN=%TCDIR%\bin
set TCTOO=%CVDIR%\TOOLS



