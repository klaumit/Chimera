@echo off

call ..\..\setraw.bat
set PATH=%LSBIN%;%LSTOO%;%PATH%

rd /s /q bin
rd /s /q obj
mkdir bin
mkdir obj

lcc86 ^
 -mp -a -v0 -O -c -cs -Ih ^
 -I%PVDIR%\com_h -I%PVDIR%\com_lib\h ^
 -oobj\op.obj c/op.c

lld ^
 -Fh -TDATA 19000 -TSYS_DATA 18400 -TSYS_EXTDATA 18000 -TXSTACK 1E000 ^
 -TFAR_BSS 08000 -M -TTEXT 80000 -oobj\op.hex ^
 %PVDIR%\com_obj\p\start.obj %PVDIR%\com_obj\p\libdata.obj obj\op.obj ^
 %PVDIR%\com_lib\p\libc.lib -L%LSC_LIB% -lp/doslib

hex2bin obj\op.hex bin\op_x86.bin


