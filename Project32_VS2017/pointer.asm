;ʹ��ָ��

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

;�����û���������
PBYTE	TYPEDEF PTR BYTE		;�ֽ�ָ��
PWORD	TYPEDEF PTR WORD		;��ָ��
PDWORD	TYPEDEF	PTR	DWORD		;˫��ָ��

.data
arraryB byte 10h,20h,30h
arraryW	word 1,2,3
arraryD DWORD 4,5,6

;��������ָ�����
ptr1 PBYTE arraryB
ptr2 PWORD arraryW
ptr3 PDWORD arraryD

.code
main PROC
	;ʹ��ָ���������
	mov esi,ptr1
	mov al,[esi]
	mov esi,ptr2
	mov ax,[esi]
	mov esi,ptr3
	mov eax,[esi]
	invoke ExitProcess,0
main ENDP
END main