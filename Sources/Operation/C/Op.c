#include "libc.h"
#include "../H/Op.h"

void main(void)
{
	volatile signed int a = 0x4A;
    volatile unsigned int b = 0x12;
	volatile int xa[4] = {0x2B,35,75,100};
	volatile int xb[2][3] = { {1,4,2}, {3,6,8 } };
    print_char(a - b); /* 8 */

    a = 0x1A;
    b = 0x1D;
    print_char(a + b); /* 7 */

    a = 0x1B;
    b = 0x02;
    print_char(a * b); /* 6 */

    a = 0x34;
    print_char(++a); /* 5 */
    print_char(--a); /* 4 */

    a = 0x38;
    b = 0x39;
    print_char(a & b); /* 8 */

    a = 0xAD;
    print_char(~a); /* R */

    a = 0x3C;
    b = 0x1B;
    print_char((a % b) + 0x30); /* 6 */

    a = 0x75;
    b = 0x03;
    print_char((a / b) + 0x10); /* 7 */

    a = 0x07;
    b = 0x03;
    print_char(a << b); /* 8 */

    a = 0xD4;
    b = 0x02;
    print_char(a >> b); /* 5 */

    a = 0xAB;
    b = 0x3F;
    print_char(a < b ? 'Y' : 'N');
    print_char(a > b ? 'Y' : 'N');
    print_char(a <= b ? 'Y' : 'N');
    print_char(a >= b ? 'Y' : 'N');
    print_char(a == b ? 'Y' : 'N');
    print_char(a != b ? 'Y' : 'N');

    a = 0xAB;
    b = 0x3F;
    print_char((a ^ b) - 590); /* F */

    a = 0xAB;
    b = 0x3F;
    print_char((a | b) - 593); /* n */

    print_char((a >= 10 && b >= 0) ? 'Y' : 'N');
    print_char((a > 5776 || b < 14) ? 'Y' : 'N');

    print_char((!(a > b)) ? 'Y' : 'N');

	if (a >= b){
		print_char('1');
	} else {
		print_char('2');
	}
	
	a = 0x91;
	switch (a) {
		case 0x91:
			print_char('S');
			break;
		default:
			print_char('F');
			break;
	}
	
	a = 3;
	while (a > 0) {
		print_char('0' + (a--));
	}
	
	a = 4;
	do {
		print_char('A' + (a+=2));
	} while (a < 11);
	
	a = 0x1234;
	b = 0;
	
	while (a) {
		b = b * 10 + a % 10;
		a /= 10;
	}
	print_char((b >> 8) + 0x30);
	
	a = 4;
	for (a = 0; a < 8; a+=3)
		print_char('0' + a);
	
	print_char(xa[1] + 6 + 23 + 5);
	xa[1] = 0x33;
	print_char(xa[1] + xa[0] + 14);
	
	print_char('0'+sizeof(xa));
	
	print_char(xb[0][2]+'a');
	
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
