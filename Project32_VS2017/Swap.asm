include Irvine32.inc

Swap PROTO,pValX:ptr dword,pValY:ptr dword

.data
Array dword 10000h,20000h
val	word ?

.code
main proc
	;��ʾ����ǰ������
	mov edi,offset val
	mov [edi],ax
	mov esi,offset Array
	mov ecx,2
	mov ebx,type Array
	call DumpMem

	invoke Swap,addr Array,addr [Array+4]
	;��ʾ�����������
	call DumpMem
	exit
main ENDP

Swap proc uses eax esi edi,
	pValX:ptr dword,
	pValY:ptr dword
;��������32λ������ֵ
	mov esi,pValX
	mov edi,pValY
	mov eax,[esi]
	xchg eax,[edi]
	mov [esi],eax
	ret
Swap endp

end main