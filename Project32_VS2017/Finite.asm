;有限状态机

include Irvine32.inc
ENTER_KEY=13
.data
InvalidInputMsg BYTE "Invalid input",13,10,0

.code
main proc
	call Clrscr

StateA:
	call GetNext	;读取下一个字符
	cmp al,'+'
	je StateB		;到状态B
	cmp al,'-'
	je StateB
	call IsDigit	;如果AL包含数字，则ZF=1
	jz StateC
	call DisplayErrorMsg
	jmp Quit
StateB:
	call Getnext	;读取下一个字符，并送入al
	call IsDigit	;如果al包含数字，则ZF=1
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
	call ReadChar	;从键盘输入
	call WriteChar	;显示在屏幕上
	ret
Getnext ENDP

DisplayErrorMsg PROC
	push edx
	mov edx,offset InvalidInputMsg
	call WriteString
	pop edx
	ret
DisplayErrorMsg ENDP

;若AL为有效的十进制字符，ZF=1;否则等于0
IsDigit PROC
	cmp al,'0'
	jb ID1
	cmp al,'9'
	ja ID1
	test ax,0	;设置ZF=1
ID1:ret
IsDigit ENDP

END main