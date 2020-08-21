;�Ѳ���
include Irvine32.inc

;ʹ�ö�̬�ڴ���䣬��������䲢���һ���ֽ�����

.data
ARRAY_SIZE = 1000
FILL_VAL EQU 0FFh

hHeap	HANDLE ?
pArray	dword ?
newHeap	dword ?
str1 byte "heap size is: ",0

.code
main proc
	invoke GetProcessHeap
	.if eax == NULL
	call WriteWindowsMsg
	jmp quit
	.else
	mov hHeap,eax
	.endif

	call allocate_array
	jnc arrayOk
	call WriteWindowsMsg
	call Crlf
	jmp Crlf

arrayOk:
	call fill_array
	call display_array
	call Crlf
	;�ͷ�����
	invoke HeapFree,hHeap,0,pArray

quit:
	exit
main endp

allocate_array proc uses eax
;��̬��������ռ�
;������eax=����Ѿ��
;���أ�����ڴ����ɹ�����CF=0
	invoke HeapAlloc,hHeap,HEAP_ZERO_MEMORY,ARRAY_SIZE
	.IF eax==NULL
		stc		;����CF=1
	.ELSE
		mov pArray,eax
		clc		;����CF=0
	.ENDIF
	ret
allocate_array endp

fill_array proc uses ecx edx esi
;��1���ַ������������
;���ܣ���
;���أ���
	mov ecx,ARRAY_SIZE
	mov esi,pArray
L1:	mov byte ptr [esi],FILL_VAL
	inc esi
	loop L1
	
	ret
fill_array endp

display_array proc uses eax ebx ecx esi
;��ʾ����
;���ܣ���
;���أ���
	mov ecx,ARRAY_SIZE
	mov esi,pArray
L1:	mov al,[esi]
	mov ebx,type byte
	call WriteHexB
	inc esi
	loop L1
	
	ret
display_array endp

end main