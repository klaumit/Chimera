#include "libc.h"
#include "../H/Op.h"

void main(void)
{
    volatile signed int a = 0x13;
    volatile unsigned int b = 0x22;
    print_char(a - b);
}

void print_char(short c)
{
    /* TODO ??? */
}
