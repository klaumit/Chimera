USERALLOBJ=	\
	"$(OUTDIR)\$(FILE0).obj"

#									#
#########################################################################

#########################################################################
#	Application							#
!MESSAGE
!MESSAGE Executing SH C/C++ Compiler phase
!MESSAGE

"$(OUTDIR)\$(FILE0).obj" : "$(SRCDIR)\$(FILE0).C" $(LNKINF0)
	$(CC) "$(SRCDIR)\$(FILE0).c" -objectfile="$(OUTDIR)\$(FILE0).obj" $(CCINF0)

#									#
#########################################################################

