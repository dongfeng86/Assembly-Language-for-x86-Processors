;����Ƕ��ѭ����ִ��ʱ��
include Irvine32.inc

.data
OUTER_LOOP_COUNT = 3
startTime DWORD ?
msg1 byte "please wait...",0dh,0ah,0
msg2 byte "elapsed milliseconds:",0

.code
main proc
	mov edx,offset msg1
	call WriteString

	;���濪ʼʱ��
	call GetMSeconds
	mov startTime,eax
	;��ʼ���ѭ��
	mov ecx,OUTER_LOOP_COUNT
L1:	call innerLoop
	loop L1

	;����ִ��ʱ��
	call GetMSeconds
	sub eax,startTime
	;��ʾִ��ʱ��
	mov edx,offset msg2
	call WriteString
	call WriteDec
	call Crlf

	exit
main ENDP

innerLoop proc
	push ecx
	mov ecx,0fffffffh
L1:	mul eax
	mul eax
	mul eax
	loop L1

	pop ecx
	ret
innerLoop ENDP

END main