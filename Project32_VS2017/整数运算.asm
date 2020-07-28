;��������
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

	;������չ�ӷ�
	mov esi,offset op1
	mov edi,offset op2
	mov ebx,offset sum
	mov ecx,lengthof op1
	call Extended_Add
	;��ʾ����
	mov esi,offset sum
	mov ecx,lengthof sum
	call Display_Sum
	call Crlf

	exit
main endp

;�����������ֽ������ŵ���չ����֮��
;���ܣ�esi��ediΪ����������ָ�룬EBXΪ��������ָ�룬ECXΪ��ӵ��ֽ���
;�����洢�����������Ĳ�������һ���ֽ�
Extended_Add proc
	pushad
	clc				;�����λ��־λ
L1:	mov al,[esi]	;mov don't modify the flag
	adc al,[edi]
	pushfd			;�����λ��־λ
	mov [ebx],al
	add esi,1
	add edi,1
	add ebx,1
	popfd
	loop L1

	mov byte ptr [ebx],0	;����������ֽ�
	adc byte ptr [ebx],0	;���Ͻ�λ
	popad
	ret
Extended_Add ENDP

;�Ӹ��ֽڵ����ֽ���ʾ����
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