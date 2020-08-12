;ArraySum过程
include Irvine32.inc

.code

ArraySum proc
;计算32位整数数组
;参数
;	ptrArray		;数组指针
;	arraySize		;数组大小
;返回 eax=和数
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