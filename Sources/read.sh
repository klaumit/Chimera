#!/bin/sh

# PREPARE: sudo apt install binutils binutils-sh-elf


find . -type f -name "*.bin" | grep -i "/user_bin/" | while read -r it; do
  dst=$(basename "${it}")
  objdump -D -Mintel,i8086 -b binary -m i386 --start-address=0x604 --stop-address=0x60d "${it}" > "${dst}.txt"
done

find . -type f -name "*.abs" | grep -i "/user_bin/" | while read -r it; do
  dst=$(basename "${it}")
  sh-elf-objdump -D -b binary -m sh3 --start-address=0x322 --stop-address=0x33c "${it}" > "${dst}.txt"
done



