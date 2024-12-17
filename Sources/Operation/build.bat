@echo off

call mk.bat
call mh.bat

mkdir out
copy /y *.s out\
copy /y obj\*.s out\
del *.s
del out\*_debug.s

