.586
.model flat,C
IndexOf proto,
	srchVal:dword,arrayPtr:ptr dword,count:dword

.code
IndexOf proc uses ecx esi edi,
	srchVal:dword,arrayPtr:ptr dword,count:dword
;��32λ��������ִ����������
;Ѱ��ָ����ֵ����������eax���ظ���ֵ������λ��
;����eax����-1
	NOT_FOUND = -1
	mov eax,srchVal		;������ֵ
	mov ecx,count		;�����С
	mov esi,arrayPtr	;����ָ��
	mov edi,0			;����

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