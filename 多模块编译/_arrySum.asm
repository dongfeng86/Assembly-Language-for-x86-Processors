;ArraySum����
include Irvine32.inc

.code

ArraySum proc
;����32λ��������
;����
;	ptrArray		;����ָ��
;	arraySize		;�����С
;���� eax=����
ptrArray equ [ebp+8]
arraySize equ [ebp+12]
	enter 0,0
	push ecx
	push esi

	mov eax,0
	mov esi,ptrArray
	mov ecx,arraySize
	cmp ecx,0
	jle L2
L1:	add eax,[esi]
	add esi,4
	loop L1

L2:	pop esi
	pop ecx
	leave 
	ret 8
ArraySum endp
end