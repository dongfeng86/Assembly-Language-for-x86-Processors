;�ӿ���̨��ȡ
include Irvine32.inc
BufSize=80

.data
buffer byte BufSize dup(?),0,0
stdInHandle HANDLE ?
bytesRead	dword ?

.code
main proc
	;��ñ�׼������
	invoke GetStdHandle,STD_INPUT_HANDLE
	mov stdInHandle,eax
	;�ȴ��û�����
	invoke ReadConsole,stdInHandle,addr buffer,
			BufSize,addr bytesRead,0
	;��ʾ������
	mov esi,offset buffer
	mov ecx,bytesRead
	mov ebx,type buffer
	call DumpMem

	exit
main endp
end main