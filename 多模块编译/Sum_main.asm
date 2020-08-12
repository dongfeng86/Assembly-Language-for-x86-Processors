;整数求和过程
;多模块示例
;本过程由用户输入多个整数，计算数组之和，并显示和数
include Irvine32.inc

extern PromptForIntegers@0:proc
extern ArraySum@0:proc,DisplaySum@0:proc

;为方便起见，重新定义外部符号
;ArraySum equ ArraySum@0
;PromptForIntegers equ PromptForIntegers@0
;DisplaySum	equ DisplaySum@0
ArraySum proto
PromptForIntegers proto
DisplaySum proto
;修改Count来修改数组大小
Count=3

.data
prompt1 byte "enter a signed interger: ",0
prompt2 byte "the sum of the integers is: ",0
array dword Count dup(?)
sum dword ?

.code
main proc
	call Clrscr

;PromptForIntegers(addr prompt1,addr array,Count)
	push Count
	push offset array
	push offset prompt1
	call PromptForIntegers

;sum = ArraySum(addr array,Count)
	push Count
	push offset array
	call ArraySum
	mov sum,eax

;DisplaySum(addr prompt2,sum)
	push sum
	push offset prompt2
	call DisplaySum
	call Crlf
	
	exit
main endp
end main