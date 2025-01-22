#!/bin/sh

echo "" > bin/op_x86.d.txt
ndisasm -b 16 -p intel bin/op_x86.com >> bin/op_x86.d.txt

sh-elf-objdump -D -b binary -m sh3 -z bin/op_sh3.com > bin/op_sh3.d.txt

