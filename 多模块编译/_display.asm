;DisplaySum过程
include Irvine32.inc

.code
DisplaySum proc
;在控制台显示和数
;接受
;	ptrPrompt	;提示字符串的偏移量
;	theSum		;数组和数
;---------------
theSum equ [ebp+12]
ptrPrompt equ [ebp+8]
	enter 0,0
	push eax
	push edx

	mov edx,ptrPrompt	;提示字符串的指针
	call WriteString
	mov eax,theSum
	call WriteInt
	call Crlf

	pop edx
	pop eax
	leave
	ret 8
DisplaySum endp
end
