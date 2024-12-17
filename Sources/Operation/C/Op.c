#include "libc.h"
#include "op.h"

void print_char(short arg) 
{
	/* TODO */
}

void main(void)
{
    volatile unsigned short a = 31484;
    volatile unsigned short b = 12393;
    print_char(a + b);
    print_char(a - b);
    print_char(a << b);
    print_char(a >> b);
    print_char(a < b);
    print_char(a > b);
    print_char(a <= b);
    print_char(a >= b);
    print_char(a == b);
    print_char(a != b);
    print_char(++b);
    print_char(--b);
    print_char(a & b);
    print_char(a ^ b);
    print_char(a * b);
    print_char(a / b);
    print_char(a % b);
    print_char(~a);
    print_char(!b);
    print_char(a | b);
    print_char(a && b);
    print_char(a || b);
    print_char(a == b ? 1 : 0);
}
