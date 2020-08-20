include Irvine32.inc

.data
message byte ": this line of text was written "
		byte "to the screen buffer",0dh,0ah
messageSize dword ($-message)

outHandle HANDLE 0
bytesWritten dword ?
lineNum dword 0
windowRect SMALL_RECT <0,0,60,11>

.code
main proc
	invoke GetStdHandle,STD_OUTPUT_HANDLE
	mov outHandle,eax

.REPEAT
	mov eax,lineNum
	call WriteDec
	invoke WriteConsole,
			outHandle,
			addr message,
			messageSize,
			addr bytesWritten,
			0
	inc lineNum
.UNTIL lineNum>50

invoke SetConsoleWindowInfo,
	outHandle,
	1,
	ADDR windowRect

	call ReadChar
	call Clrscr
	invoke ExitProcess,0
main endp
end main