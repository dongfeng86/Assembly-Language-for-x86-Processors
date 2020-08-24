.586
.model flat,C
IndexOf proto,
	srchVal:dword,arrayPtr:ptr dword,count:dword

.code
IndexOf proc uses ecx esi edi,
	srchVal:dword,arrayPtr:ptr dword,count:dword
;对32位整数数组执行线形搜索
;寻找指定数值，若发现用eax返回该数值的索引位置
;否则，eax返回-1
	NOT_FOUND = -1
	mov eax,srchVal		;搜索数值
	mov ecx,count		;数组大小
	mov esi,arrayPtr	;数组指针
	mov edi,0			;索引

L1:	cmp [esi+edi*4],eax
	je found
	inc edi
	loop L1

notFound:
	mov eax,NOT_FOUND
	jmp short exit

found:
	mov eax,edi

exit:
	ret
IndexOf endp
end