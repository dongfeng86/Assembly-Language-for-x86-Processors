;������͹���
;��ģ��ʾ��
;���������û���������������������֮�ͣ�����ʾ����
include Irvine32.inc

extern PromptForIntegers@0:proc
extern ArraySum@0:proc,DisplaySum@0:proc

;Ϊ������������¶����ⲿ����
;ArraySum equ ArraySum@0
;PromptForIntegers equ PromptForIntegers@0
;DisplaySum	equ DisplaySum@0
ArraySum proto
PromptForIntegers proto
DisplaySum proto
;�޸�Count���޸������С
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