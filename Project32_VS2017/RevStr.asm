;字符串翻转
.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO,dwExitCode:DWORD

;创建一个指针类型
PWORD TYPEDEF PTR WORD

.data
aName byte "Abraham Lincoln",0
nameSize=($-aName)-1		;等号伪指令

ptr1 PWORD aName


.code
main PROC
	mov ecx,nameSize
	mov esi,0

	;注意下面这一句，编译错误，因为变量名+寄存器形式的变址寻址，汇编器
	;会根据变量的类型判断源操作数的内存大小
	;mov dx,aName[esi]
	;下面一句同样错误，这属于直接偏移量寻址，会根据变量的类型判断源操作数的大小
	;mov dx,[aName+1]
	;下面一句正确，在间接操作数中，编译器会根据目的操作数判断源操作数的空间大小
	mov edi,offset aName
	mov dx,[edi]

;L1:	movzx eax,[aName+esi]
L1:	movzx ax,[aName+esi]
	;push eax
	push ax		;push必须是16或者32位的寄存器/内存操作数
	inc	esi
	loop L1

;将名字按逆序弹出堆栈
;并存入aName数组
	mov ecx,nameSize
	mov esi,0
L2:	;pop eax
	pop ax		;pop必须是16或者32位的寄存器/内存操作数
	mov aName[esi],al
	inc esi
	loop L2

	INVOKE ExitProcess,0
main ENDP
END main	