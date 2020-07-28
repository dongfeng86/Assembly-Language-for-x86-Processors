;整数运算
include Irvine32.inc

.data
op1 byte 34h,12h,98h,74h,06h,0a4h,0b2h,0a2h
op2 byte 02h,45h,23h,0h,0h,87h,10h,80h
sum byte 9 dup(0)

.code
main proc
	mov al,48
	mov bl,-8
	imul bl

	mov dl,0
	mov al,0ffh
	add al,0ffh
	adc dl,0

	mov edx,0
	mov eax,0ffffffffh
	add eax,0ffffffffh
	adc edx,0

	;调用扩展加法
	mov esi,offset op1
	mov edi,offset op2
	mov ebx,offset sum
	mov ecx,lengthof op1
	call Extended_Add
	;显示和数
	mov esi,offset sum
	mov ecx,lengthof sum
	call Display_Sum
	call Crlf

	exit
main endp

;计算两个以字节数组存放的扩展整数之和
;接受：esi和edi为两个加数的指针，EBX为和数变量指针，ECX为相加的字节数
;和数存储区必须比输入的操作数多一个字节
Extended_Add proc
	pushad
	clc				;清除进位标志位
L1:	mov al,[esi]	;mov don't modify the flag
	adc al,[edi]
	pushfd			;保存进位标志位
	mov [ebx],al
	add esi,1
	add edi,1
	add ebx,1
	popfd
	loop L1

	mov byte ptr [ebx],0	;清楚和数高字节
	adc byte ptr [ebx],0	;加上进位
	popad
	ret
Extended_Add ENDP

;从高字节到低字节显示数字
Display_Sum proc
	pushad
	add esi,ecx
	sub esi,type byte
	mov ebx,type byte
2L1:	mov al,[esi]
	call WriteHexB
	sub esi,type byte
	loop L1

	popad
	ret
Display_Sum endp

END main