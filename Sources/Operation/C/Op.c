#include "libc.h"
#include "op.h"

void main(void)
{
    volatile signed int a = 13;
    volatile unsigned int b = 4;
    print_char(a << b);
}

void print_char(short c)
{
    /* TODO ??? */
}
