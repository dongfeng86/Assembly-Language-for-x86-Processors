;����״̬��

include Irvine32.inc
ENTER_KEY=13
.data
InvalidInputMsg BYTE "Invalid input",13,10,0

.code
main proc
	call Clrscr

StateA:
	call GetNext	;��ȡ��һ���ַ�
	cmp al,'+'
	je StateB		;��״̬B
	cmp al,'-'
	je StateB
	call IsDigit	;���AL�������֣���ZF=1
	jz StateC
	call DisplayErrorMsg
	jmp Quit
StateB:
	call Getnext	;��ȡ��һ���ַ���������al
	call IsDigit	;���al�������֣���ZF=1
	jz StateC
	call DisplayErrorMsg
	jmp Quit
StateC:
	call Getnext
	call IsDigit
	jz StateC
	cmp al,ENTER_KEY
	je Quit
	call DisplayErrorMsg
	jmp Quit
Quit:
	call Crlf
	exit
main ENDP

Getnext PROC
	call ReadChar	;�Ӽ�������
	call WriteChar	;��ʾ����Ļ��
	ret
Getnext ENDP

DisplayErrorMsg PROC
	push edx
	mov edx,offset InvalidInputMsg
	call WriteString
	pop edx
	ret
DisplayErrorMsg ENDP

;��ALΪ��Ч��ʮ�����ַ���ZF=1;�������0
IsDigit PROC
	cmp al,'0'
	jb ID1
	cmp al,'9'
	ja ID1
	test ax,0	;����ZF=1
ID1:ret
IsDigit ENDP

END main