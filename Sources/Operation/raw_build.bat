@echo off

echo ::: Setting up environment :::
call ..\..\setraw.bat
set PATH=%LSBIN%;%LSTOO%;%PATH%
set PATH=%TCBIN%;%TCTOO%;%PATH%
set EDIST=..\..\Tools\dist

echo ::: Deleting old binaries :::
rd /s /q bin
rd /s /q obj
mkdir bin
mkdir obj

echo ::: Compiling to text :::
lcc86 -SC ^
 -a -B -c -cn -cs -D_M86 -I%PVDIR%\com_h -I%PVDIR%\com_lib\h ^
 -Ih -j0 -ms -O -oobj\op_x86.asm -v0 c/op.c

echo ::: Compiling to object :::
lcc86 ^
 -a -B -c -cn -cs -D_M86 -I%PVDIR%\com_h -I%PVDIR%\com_lib\h ^
 -Ih -j0 -ms -O -oobj\op_x86.obj -v0 c/op.c

echo ::: Linking to binary ::: 
lld ^
 -Fc -L%LSC_LIB% -g -M -oobj\op_x86.com -T 0x100 obj\op_x86.obj

echo ::: Correcting folder :::
move obj\*.com bin\ >nul

echo ::: Compiling to assembly :::
shc ^
 -cpu=sh3 -chgincpath -errorpath -lang=c -nologo -size ^
 -optimize=1 -define=_MH3 -comment=nest -code=asmcode ^
 -listfile="obj\op_sh3.txt" -objectfile="obj\op_sh3.asm" ^
 -include="h","%CVDIR%\lib\LibH","%CVDIR%\lib\hilib" "c\op.c"

echo ::: Assembling to text and object :::
asmsh ^
 -cpu=sh3 -list="obj\op_sh3.txt" -object="obj\op_sh3.obj" ^
 -source -cross_reference -section -nologo "obj\op_sh3.asm"

echo ::: Linking to binary :::
optlnk -subcommand=linking.prm

echo ::: Done :::

