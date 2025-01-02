#!/bin/sh
sh-elf-objdump -D -b binary -m sh3 bin/*_sh3.rom > file1.txt
sh-elf-objdump -D -b binary -m sh3 bin/*_sh3.com > file2.txt
meld file1.txt file2.txt
