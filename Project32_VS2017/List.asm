include Irvine32.inc

;�꣬�ڿ���̨��ʾһ���ַ�
mPutchar macro char
	push eax
	mov al,char
	call WriteChar
	pop eax
endm

ListNode struct
	NodeData dword ?
	NextPtr dword ?
ListNode ends

TotalNodeCount=15
NULL=0
Counter=0

.data
LinkedList label ptr ListNode
repeat TotalNodeCount
	Counter=Counter+1
	ListNode <Counter,($+Counter*sizeof ListNode)>
endm
ListNode <0,0>		;β�ڵ�

.code
main proc
	;�������÷�
	mPutchar 'z'
	mPutchar 'a'
	mPutchar 'n'
	
	;����������Ĵ���
	mov esi,offset LinkedList
NextNode:
	;�ڿ���̨��ʾһ���ַ�
	;��ʾNodeData���ֵ
	mov eax,(ListNode ptr [esi]).NextPtr
	cmp eax,NULL
	je quit
	;��ʾ�ڵ�����
	mov eax,(ListNode ptr [esi]).NodeData
	call WriteDec
	call Crlf
	;�����һ�ڵ��ָ��
	mov esi,(ListNode ptr [esi]).NextPtr
	jmp NextNode

quit:
	exit
main endp
end main