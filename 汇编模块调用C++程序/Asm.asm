;;C++调用的ASM函数
;include Irvine32.inc
;
;;外部C++函数
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
;;设置文本颜色，并清除控制台窗口
;;调用Irvine32库函数
	;mov eax,color
	;call SetTextColor
	;call Clrscr
	;ret
;SetTextOutColor endp
;
;DisplayTable proc c
;;输入一个整数n并显示范围n*21~n*2^10的乘法表
	;invoke askForInteger	;调用C++函数
	;mov intVal,eax			;保存整数
	;mov ecx,ENDING_POWER	;循环计数器
;L1:	push ecx				;VC++函数不会保存和恢复通用寄存器，因此需要在主调函数进行保存
	;shl intVal,1			;乘以2
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