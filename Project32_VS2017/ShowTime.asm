;�ṹ���ʹ��
include Irvine32.inc

.data
sysTime SYSTEMTIME <>
XYPos COORD	<10,5>
consoleHandle dword ?
colonStr byte ":",0

.code
main proc
;��ȡwin32����̨�ı�׼������
	invoke GetStdHandle,STD_OUTPUT_HANDLE
	mov consoleHandle,eax
;���ù��λ�û�ȡϵͳʱ��
	invoke SetConsoleCursorPosition,consoleHandle,XYPos
	invoke GetLocalTime,addr sysTime
;��ʾϵͳʱ��
	movzx eax,sysTime.wHour	;hour
	call WriteDec
	mov edx,offset colonStr	;output ":"
	call WriteString
	movzx eax,sysTime.wMinute	;minute
	call WriteDec
	call WriteString
	movzx eax,sysTime.wSecond	;second
	call WriteDec
	call Crlf
	call WaitMsg
	exit
main endp

end main