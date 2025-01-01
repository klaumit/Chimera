@echo off

echo ::: Setting up environment :::
call ..\..\setraw.bat
set PATH=%LSBIN%;%LSTOO%;%PATH%

echo ::: Deleting old binaries :::
rd /s /q bin
rd /s /q obj
mkdir bin
mkdir obj

echo ::: Compiling to text :::
lcc86 -SC ^
 -ms -a -v0 -O -c -cs -Ih ^
 -I%PVDIR%\com_h -I%PVDIR%\com_lib\h ^
 -oobj\op.txt c/op.c

echo ::: Compiling to object :::
lcc86 ^
 -ms -a -v0 -O -c -cs -Ih ^
 -I%PVDIR%\com_h -I%PVDIR%\com_lib\h ^
 -oobj\op.obj c/op.c

echo ::: Linking to hex :::
lld ^
 -Fh -TDATA 19000 -TSYS_DATA 18400 -TSYS_EXTDATA 18000 -TXSTACK 1E000 ^
 -TFAR_BSS 08000 -M -TTEXT 80000 -oobj\op.hex obj\op.obj -L%LSC_LIB%

echo ::: Converting to binary :::
hex2bin obj\op.hex bin\op_x86.bin

echo ::: Done :::

