;结构体的使用
include Irvine32.inc

.data
sysTime SYSTEMTIME <>
XYPos COORD	<10,5>
consoleHandle dword ?
colonStr byte ":",0

.code
main proc
;获取win32控制台的标准输出句柄
	invoke GetStdHandle,STD_OUTPUT_HANDLE
	mov consoleHandle,eax
;设置光标位置获取系统时间
	invoke SetConsoleCursorPosition,consoleHandle,XYPos
	invoke GetLocalTime,addr sysTime
;显示系统时间
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