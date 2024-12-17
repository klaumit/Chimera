#include "libc.h"
#include "op.h"

void print_char(short arg)
{
    /* TODO */
}

void main(void)
{
    volatile signed char x1 = 3;
    volatile unsigned char x2 = 3;
    volatile signed short x3 = 3;
    volatile unsigned short x4 = 3;
    volatile signed int x5 = 3;
    volatile unsigned int x6 = 3;
    volatile signed long x7 = 3;
    volatile unsigned long x8 = 3;
    volatile float x9 = 3;
    volatile double x10 = 3;
    volatile long double x11 = 3;

    char x12[] = "hello";
    char x13[5] = "hello";

    int c[10] = {1, 2, 3};
    int d[] = {1, 2, 3};
    int e[2][3] = {{1, 2, 3}, {4, 5, 6}};
    int f[][3] = {{1}, {2, 3}, {4, 5, 6}};

    volatile unsigned short a = 31484;
    volatile unsigned short b = 12393;

    print_char(c[0] + c[1]);
    print_char(d[1] * d[0]);
    print_char(e[1][2] - e[0][0]);
    print_char(f[1][1]);

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
