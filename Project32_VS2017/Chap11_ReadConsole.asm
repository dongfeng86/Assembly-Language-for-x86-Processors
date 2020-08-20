;从控制台读取
include Irvine32.inc
BufSize=80

.data
buffer byte BufSize dup(?),0,0
stdInHandle HANDLE ?
bytesRead	dword ?

.code
main proc
	;获得标准输入句柄
	invoke GetStdHandle,STD_INPUT_HANDLE
	mov stdInHandle,eax
	;等待用户输入
	invoke ReadConsole,stdInHandle,addr buffer,
			BufSize,addr bytesRead,0
	;显示缓冲区
	mov esi,offset buffer
	mov ecx,bytesRead
	mov ebx,type buffer
	call DumpMem

	exit
main endp
end main