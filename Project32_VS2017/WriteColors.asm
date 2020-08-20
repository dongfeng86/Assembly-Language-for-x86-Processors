include Irvine32.inc

.data
outHandle HANDLE ?
cellsWritten dword ?
xyPos COORD <10,20>

;字符编号数组：
buffer byte 'a','b','c','d','e','f','g',8,9,10,11,12,13,14,15
		byte 16,17,18,19,20
BufSize dword ($-buffer)

;属性数组
attributes word 0fh,0eh,0dh,0ch,0bh,0ah,9,8,7,6
			word 5,4,3,2,1,0f0h,0e0h,0d0h,0c0h,0b0h

.code
main proc
;获取控制台标准输出句柄
	invoke GetStdHandle,STD_OUTPUT_HANDLE
	mov outHandle,eax
;设置相邻单元格颜色：
	invoke WriteConsoleOutputAttribute,
			outHandle,
			addr attributes,
			BufSize,
			xyPos,
			addr cellsWritten
;写1到20号字符
	invoke WriteConsoleOutputCharacter,
			outHandle,
			addr buffer,
			BufSize,
			xyPos,
			addr cellsWritten

	invoke ExitProcess,0
main endp
end main