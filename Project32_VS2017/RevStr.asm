;�ַ�����ת
.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO,dwExitCode:DWORD

;����һ��ָ������
PWORD TYPEDEF PTR WORD

.data
aName byte "Abraham Lincoln",0
nameSize=($-aName)-1		;�Ⱥ�αָ��

ptr1 PWORD aName


.code
main PROC
	mov ecx,nameSize
	mov esi,0

	;ע��������һ�䣬���������Ϊ������+�Ĵ�����ʽ�ı�ַѰַ�������
	;����ݱ����������ж�Դ���������ڴ��С
	;mov dx,aName[esi]
	;����һ��ͬ������������ֱ��ƫ����Ѱַ������ݱ����������ж�Դ�������Ĵ�С
	;mov dx,[aName+1]
	;����һ����ȷ���ڼ�Ӳ������У������������Ŀ�Ĳ������ж�Դ�������Ŀռ��С
	mov edi,offset aName
	mov dx,[edi]

;L1:	movzx eax,[aName+esi]
L1:	movzx ax,[aName+esi]
	;push eax
	push ax		;push������16����32λ�ļĴ���/�ڴ������
	inc	esi
	loop L1

;�����ְ����򵯳���ջ
;������aName����
	mov ecx,nameSize
	mov esi,0
L2:	;pop eax
	pop ax		;pop������16����32λ�ļĴ���/�ڴ������
	mov aName[esi],al
	inc esi
	loop L2

	INVOKE ExitProcess,0
main ENDP
END main	