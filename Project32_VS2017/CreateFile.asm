;创建一个文件
include Irvine32.inc
BUFFER_SIZE = 501

.data
buffer byte BUFFER_SIZE dup(?)
filename byte "output.txt",0
fileHandle	HANDLE ?
stringLength dword ?
byteWritten dword ?
str1 byte "cannot create file",0dh,0ah,0
str2 byte "bytes written to file [output.txt]:",0
str3 byte "enter up to 500 characters and press"
	byte "[enter]: ",0dh,0ah,0

.code
main proc
;创建一个新文本文件
	mov edx,offset filename
	call CreateOutputFile
	mov fileHandle,eax
;错误检查
	cmp eax,INVALID_HANDLE_VALUE	;发现错误
	jne file_ok
	mov edx,offset str1
	call WriteString
	jmp quit
file_ok:
;提示用户输入字符串
	mov edx,offset str3
	call WriteString
	mov ecx,BUFFER_SIZE
	mov edx,offset buffer
	call ReadString
	mov stringLength,eax
;将缓冲区写入输入文件
	mov eax,fileHandle
	mov edx,offset buffer
	mov ecx,stringLength
	call WriteToFile
	mov byteWritten,eax
	call CloseFile
;显示返回值
	mov edx,offset str2
	call WriteString
	mov eax,byteWritten
	call WriteDec
	call Crlf

quit:
	exit
main endp
end main	