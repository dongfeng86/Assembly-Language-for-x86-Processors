INCLUDE Irvine32.inc
NumPoints = 3
.data
align word
AllPoints COORD NumPoints DUP(<0,0>)

.code
main PROC
	mov	edi,0				; array index
	mov	ecx,NumPoints			; loop counter
	mov	ax,1					; starting X, Y values

L1:	;mov	(COORD PTR AllPoints[edi]).X,ax
	mov	(AllPoints[edi]).X,ax
	;mov	(COORD PTR AllPoints[edi]).Y,ax
	mov	(AllPoints[edi]).Y,ax

	add	edi,TYPE COORD
	inc	ax
	loop L1

	exit
main ENDP
END main