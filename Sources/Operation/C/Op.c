#include "libc.h"
#include "../H/Op.h"

void main(void)
{
    volatile signed int a = 0x13;
    volatile unsigned int b = 0x22;
    print_char(a - b);
    print_char(a - b);
    print_nl();
    print_char(a - b);
    print_nl();
    exit_dos();
}

void exit_dos(void)
{
#ifdef _M86
    nf_exit();
#elif _MH3
    Vagina1
#endif
}

void print_nl(void)
{
#ifdef _M86
    nf_nl();
#elif _MH3
    Vagina2
#endif
}

void print_char(short c)
{
#ifdef _M86
    nf_char(c);
#elif _MH3
    Vagina3
#endif
}
