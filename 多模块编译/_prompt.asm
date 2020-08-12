;提示整数输入请求
include Irvine32.inc

.code
PromptForIntegers proc
;提示用户为数组输入整数，并用用户输入填充该数组
;参数：
; ptrPrompt:ptr byte	;提示信息字符串
; ptrArray:ptr dword	;数组指针
; arraySize:dword		;数组大小
;返回：无
arraySize	equ [ebp+16]
ptrArray	equ [ebp+12]
ptrPrompt	equ [ebp+8]
	enter 0,0		;为过程构造堆栈帧，第一个参数表示保存局部堆栈变量需要的字节数，第二个为0
	pushad
	mov ecx,arraySize
	cmp ecx,0
	jle L2
	mov edx,ptrPrompt
	mov esi,ptrArray
L1:	call WriteString	;显示字符串
	call ReadInt
	call Crlf
	mov [esi],eax
	add esi,4
	loop L1
L2:	popad
	leave
	ret 12
PromptForIntegers endp
end