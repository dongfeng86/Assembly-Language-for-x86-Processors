;����Ժ���#1:����I/O

include Irvine32.inc

.data
COUNT=4
BlueTextOnGray = blue+(lightGray*16)
DefaultColor=lightGray+(black*16)
arrayD SDWORD 12345678h,1A4B2000h,3434h,7AB9h
prompt byte "enter a 32-bit signed integer:",0

.code
main proc
	;ѡ��ǳ�ұ�����ɫ�ı�
	mov eax,BlueTextOnGray
	call SetTextColor
	call Clrscr

	;��DumpMem��ʾ����
	mov esi,offset arrayD			;��ʼλ�õ�ƫ����
	mov ebx,type arrayD				;ÿ��Ԫ�ص��ֽ���
	mov ecx,LENGTHOF arrayD		;Ԫ�ظ���
	call DumpMem					;�ڿ���̨����ʾ�ڴ�

	;�����û�����һ���з�������
	call Crlf
	mov ecx,COUNT
L1:	mov edx,offset prompt
	call WriteString
	call ReadInt
	call Crlf

	;��ʮ���ơ�ʮ�����ơ���������ʾ����
	call WriteInt
	call Crlf
	call WriteHex
	call Crlf
	call WriteBin
	call Crlf
	call Crlf
	loop L1

	;���ؿ���̨���ڵ�Ĭ����ɫ
	call WaitMsg
	mov eax,DefaultColor
	call SetTextColor
	call Clrscr

	exit
main ENDP
END main



	