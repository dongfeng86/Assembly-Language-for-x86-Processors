;�ӷ��ͼ���

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
	;�鿴������ƫ�Ƶ�ַ
	mov esi,OFFSET Rval		;���ƫ�Ƶ�ַΪ00404000
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

	;���־λʾ��
	mov cx,1
	sub cx,1
	mov ax,0ffffh
	inc ax

	;���ű�־λʾ��
	mov cx,1
	sub cx,1
	mov ax,7fffh
	add ax,2

	;��λ��־λʾ��
	mov al,0ffh
	add al,1

	;�����־λʾ��
	mov al,127
	add al,1
	mov al,-128
	sub al,1

	mov ax,7ff0h
	add al,10h

	INVOKE	ExitProcess,0
main ENDP
END main