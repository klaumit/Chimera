#!/bin/sh

# PREPARE: sudo apt install binutils binutils-sh-elf


find . -type f -name "*_x86.com" | while read -r it; do
  dst=$(basename "${it}")
  objdump -D -Mintel,i8086 -b binary -m i386 "${it}" > "${dst}.txt"
done

find . -type f -name "*_sh3.com" | while read -r it; do
  dst=$(basename "${it}")
  sh-elf-objdump -D -b binary -m sh3 "${it}" > "${dst}.txt"
done



