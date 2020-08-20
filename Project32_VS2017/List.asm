include Irvine32.inc

;宏，在控制台显示一个字符
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
ListNode <0,0>		;尾节点

.code
main proc
	;试验宏的用法
	mPutchar 'z'
	mPutchar 'a'
	mPutchar 'n'
	
	;以下是链表的代码
	mov esi,offset LinkedList
NextNode:
	;在控制台显示一个字符
	;显示NodeData域的值
	mov eax,(ListNode ptr [esi]).NextPtr
	cmp eax,NULL
	je quit
	;显示节点数据
	mov eax,(ListNode ptr [esi]).NodeData
	call WriteDec
	call Crlf
	;获得下一节点的指针
	mov esi,(ListNode ptr [esi]).NextPtr
	jmp NextNode

quit:
	exit
main endp
end main