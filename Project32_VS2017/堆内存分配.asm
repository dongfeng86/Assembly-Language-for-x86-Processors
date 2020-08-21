;堆测试
include Irvine32.inc

;使用动态内存分配，本程序分配并填充一个字节数组

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
	;释放数组
	invoke HeapFree,hHeap,0,pArray

quit:
	exit
main endp

allocate_array proc uses eax
;动态分配数组空间
;参数：eax=程序堆句柄
;返回：如果内存分配成功，则CF=0
	invoke HeapAlloc,hHeap,HEAP_ZERO_MEMORY,ARRAY_SIZE
	.IF eax==NULL
		stc		;返回CF=1
	.ELSE
		mov pArray,eax
		clc		;返回CF=0
	.ENDIF
	ret
allocate_array endp

fill_array proc uses ecx edx esi
;用1个字符填充整个数组
;接受：无
;返回：无
	mov ecx,ARRAY_SIZE
	mov esi,pArray
L1:	mov byte ptr [esi],FILL_VAL
	inc esi
	loop L1
	
	ret
fill_array endp

display_array proc uses eax ebx ecx esi
;显示数组
;接受：无
;返回：无
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