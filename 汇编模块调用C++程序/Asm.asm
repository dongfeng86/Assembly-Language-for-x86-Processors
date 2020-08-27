;;C++���õ�ASM����
;include Irvine32.inc
;
;;�ⲿC++����
;askForInteger proto C
;showInt proto C,value:SDWORD,outWidth:DWORD
;newLine proto C
;
;OUT_WIDTH=8
;ENDING_POWER=10
;
;.data
;intVal DWORD ?
;
;.code
;SetTextOutColor proc c,
	;color:dword
;;�����ı���ɫ�����������̨����
;;����Irvine32�⺯��
	;mov eax,color
	;call SetTextColor
	;call Clrscr
	;ret
;SetTextOutColor endp
;
;DisplayTable proc c
;;����һ������n����ʾ��Χn*21~n*2^10�ĳ˷���
	;invoke askForInteger	;����C++����
	;mov intVal,eax			;��������
	;mov ecx,ENDING_POWER	;ѭ��������
;L1:	push ecx				;VC++�������ᱣ��ͻָ�ͨ�üĴ����������Ҫ�������������б���
	;shl intVal,1			;����2
	;invoke showInt,intVal,OUT_WIDTH
	;call Crlf
	;pop ecx
	;loop L1
;
	;ret
;DisplayTable endp
;end

INCLUDE Irvine32.inc

askForInteger PROTO C
showInt PROTO C, value:SDWORD, outWidth:DWORD

OUT_WIDTH = 8
ENDING_POWER = 10

.data
intVal DWORD ?

.code
;---------------------------------------------
SetTextOutColor PROC C, 
	color:DWORD
;
; Sets the text colors and clears the console
; window. Calls Irvine32 library functions.
;---------------------------------------------
	mov	eax,color
	call	SetTextColor
	call	Clrscr
	ret
SetTextOutColor ENDP

;---------------------------------------------
DisplayTable PROC C
;
; Inputs an integer n and displays a
; multiplication table ranging from n * 2^1
; to n * 2^10.
;----------------------------------------------
	INVOKE askForInteger	; call C++ function
	mov	intVal,eax            	; save the integer
	mov	ecx,ENDING_POWER       	; loop counter

L1:	push ecx                    	; save loop counter
	shl  intVal,1               	; multiply by 2
	INVOKE showInt,intVal,OUT_WIDTH
	call	Crlf
	pop	ecx	; restore loop counter
    loop	L1

	ret
DisplayTable ENDP

END