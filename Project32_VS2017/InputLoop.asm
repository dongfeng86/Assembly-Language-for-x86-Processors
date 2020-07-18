;库测试函数#1:整数I/O

include Irvine32.inc

.data
COUNT=4
BlueTextOnGray = blue+(lightGray*16)
DefaultColor=lightGray+(black*16)
arrayD SDWORD 12345678h,1A4B2000h,3434h,7AB9h
prompt byte "enter a 32-bit signed integer:",0

.code
main proc
	;选择浅灰背景蓝色文本
	mov eax,BlueTextOnGray
	call SetTextColor
	call Clrscr

	;用DumpMem显示数组
	mov esi,offset arrayD			;开始位置的偏移量
	mov ebx,type arrayD				;每个元素的字节数
	mov ecx,LENGTHOF arrayD		;元素个数
	call DumpMem					;在控制台中显示内存

	;请求用户输入一组有符号整数
	call Crlf
	mov ecx,COUNT
L1:	mov edx,offset prompt
	call WriteString
	call ReadInt
	call Crlf

	;用十进制、十六进制、二进制显示整数
	call WriteInt
	call Crlf
	call WriteHex
	call Crlf
	call WriteBin
	call Crlf
	call Crlf
	loop L1

	;返回控制台窗口的默认颜色
	call WaitMsg
	mov eax,DefaultColor
	call SetTextColor
	call Clrscr

	exit
main ENDP
END main



	