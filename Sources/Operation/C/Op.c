#include "libc.h"
#include "../H/Op.h"

void main(void)
{
    volatile signed int a = 0x4B;
    volatile unsigned int b = 0x12;
    print_char(a - b);
    exit_dos();
}

void exit_dos(void)
{
    nf_exit();
}

void print_nl(void)
{
    nf_nl();
}

void print_char(short c)
{
    nf_char(c);
}
