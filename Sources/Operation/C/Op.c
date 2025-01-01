#include "libc.h"
#include "op.h"

void main(void)
{
    volatile signed int a = 13;
    volatile unsigned int b = 22;
    print_char(a + b);
    print_char(a - b);
    print_char(a * b);
    print_char(b / b);
    print_char(b % b);
}

void print_char(short c)
{
    /* TODO ??? */
}
