;DisplaySum����
include Irvine32.inc

.code
DisplaySum proc
;�ڿ���̨��ʾ����
;����
;	ptrPrompt	;��ʾ�ַ�����ƫ����
;	theSum		;�������
;---------------
theSum equ [ebp+12]
ptrPrompt equ [ebp+8]
	enter 0,0
	push eax
	push edx

	mov edx,ptrPrompt	;��ʾ�ַ�����ָ��
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
