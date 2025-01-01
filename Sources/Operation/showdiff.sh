#!/bin/sh
cd bin
../../read.sh
diff -y op_x86.com.txt op_sh3.com.txt
