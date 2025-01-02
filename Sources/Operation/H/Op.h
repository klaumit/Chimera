
#ifndef EXP_DEF
#define EXP_DEF
#include "define.h"

void exit_dos(void);
void print_char(short c);
void print_nl(void);

#ifdef _M86

#define nf_exit() _asm_nf_exit("\n mov ax, 4C00h \n int 21h \n")
void _asm_nf_exit();

#define nf_char(c) _asm_nf_char("\n mov dl, al \n mov ah, 02h \n int 21h \n", c)
void _asm_nf_char(unsigned char *, unsigned char);

#define nf_nl() _asm_nf_nl("\n mov ah, 02h \n mov dl, 0Dh \n int 21h \n mov dl, 0Ah \n int 21h \n")
void _asm_nf_nl();

#elif _MH3

#pragma inline_asm(rotl)
static int rotl(int a)
{
    ROTL R4
    MOV R4,R0
}

#endif

#endif
