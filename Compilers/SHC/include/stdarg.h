/*------------------------------------------------------*/
/* SH SERIES C Compiler Ver. 1.0                        */
/* Copyright (c) 1992 Hitachi,Ltd.                      */
/* Licensed material of Hitachi,Ltd.                    */
/*------------------------------------------------------*/
/*****************************************************************/
/* SPEC ;                                                        */
/*   NAME = stdarg :                                             */
/*   FUNC = this module do the following finctions ;             */
/*                                                               */
/*         (1) initialize parameter pointer                      */
/*         (2) set parameter pointer to next parameter           */
/*                                                               */
/*                                                               */
/*   END ;                                                       */
/*****************************************************************/
#ifndef _STDARG
#define _STDARG

typedef char *va_list ;

#define va_start(ap,param) (void)((ap)=(int)\
((char *) &(param)+sizeof(param))%4u?\
(char *) &(param)+sizeof(param)+(4u-(sizeof(param)%4u)):\
(char *) &(param)+sizeof(param))

#define va_arg(ap,type) (*((ap)=((int)((ap)+sizeof(type))%4u?\
(ap)+sizeof(type)+(4u-(sizeof(type)%4u)):\
(ap)+sizeof(type)),\
(type *)((int)((ap)-sizeof(type))%4u?\
(ap)-sizeof(type)-(4u-(sizeof(type)%4u)):\
(ap)-sizeof(type))))

#define va_end(ap)

#endif
