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
 -Fc -L%LSC_LIB% -g -M -oobj\op_x86.bin -T 0x100 obj\op_x86.obj

echo ::: Correcting folder :::
move obj\*.bin bin\ >nul

echo ::: Compiling to text and object :::
shc ^
 -cpu=sh3 -chgincpath -errorpath -lang=c -nologo ^
 -optimize=1 -define=_MH3 -comment=nest -size ^
 -listfile="obj\op_sh3.txt" -objectfile="obj\op_sh3.obj" ^
 -include="h","%CVDIR%\lib\LibH","%CVDIR%\lib\hilib" "c\op.c"
  
echo ::: Linking to binary :::
optlnk -subcommand=linking.prm
 
echo ::: Preparing :::
mkdir %TEMP%\Extra
copy /y %EDIST%\* %TEMP%\Extra\
copy /y obj\*_sh3.txt bin

echo ::: Patching :::
%TEMP%\Extra\ComPatcher bin
del bin\*_sh3.txt
rd /s /q %TEMP%\Extra

echo ::: Done :::

