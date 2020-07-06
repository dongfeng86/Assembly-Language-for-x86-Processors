;加法和减法

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
Rval sdword ?
Xval sdword 26
Yval sdword 30
Zval sdword 40

.code
main PROC
	;查看变量的偏移地址
	mov esi,OFFSET Rval		;这个偏移地址为00404000
	mov esi,OFFSET Xval	
	mov esi,OFFSET Yval
	mov esi,OFFSET Zval

	;inc and dec
	mov ax,1000h
	inc ax
	dec ax

	;Rval=-Xval+(Yval-Zval)
	mov eax,Xval
	neg eax
	mov ebx,Yval
	sub ebx,Zval
	add eax,ebx
	mov Rval,eax

	;零标志位示例
	mov cx,1
	sub cx,1
	mov ax,0ffffh
	inc ax

	;符号标志位示例
	mov cx,1
	sub cx,1
	mov ax,7fffh
	add ax,2

	;进位标志位示例
	mov al,0ffh
	add al,1

	;溢出标志位示例
	mov al,127
	add al,1
	mov al,-128
	sub al,1

	mov ax,7ff0h
	add al,10h

	INVOKE	ExitProcess,0
main ENDP
END main