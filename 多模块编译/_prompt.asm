;��ʾ������������
include Irvine32.inc

.code
PromptForIntegers proc
;��ʾ�û�Ϊ�������������������û�������������
;������
; ptrPrompt:ptr byte	;��ʾ��Ϣ�ַ���
; ptrArray:ptr dword	;����ָ��
; arraySize:dword		;�����С
;���أ���
arraySize	equ [ebp+16]
ptrArray	equ [ebp+12]
ptrPrompt	equ [ebp+8]
	enter 0,0		;Ϊ���̹����ջ֡����һ��������ʾ����ֲ���ջ������Ҫ���ֽ������ڶ���Ϊ0
	pushad
	mov ecx,arraySize
	cmp ecx,0
	jle L2
	mov edx,ptrPrompt
	mov esi,ptrArray
L1:	call WriteString	;��ʾ�ַ���
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