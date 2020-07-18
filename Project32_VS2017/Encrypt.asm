include Irvine32.inc
KEY=239
BUFMAX=128

.data
sPrompt byte "enter the plain text:",0
sEncrypt byte "cipher text:        ",0
sDecrypt byte "Decrypted:          ",0
buffer byte BUFMAX+1 DUP(0)
bufSize DWord ?

.code
main proc
	call InputTheString		;��������
	call TranslateBuffer	;���ܻ�����
	mov edx,offset sEncrypt	;��ʾ������Ϣ
	call DisplayMessage
	call TranslateBuffer	;���ܻ�����
	mov edx,offset sDecrypt	;��ʾ������Ϣ
	call DisplayMessage
	exit
main ENDP

;-------------------------------------
;��ʾ�û�����һ�����ı��ַ���
;�����ַ��������ĳ���
;-------------------------------------
InputTheString proc
	pushad
	mov edx,offset sPrompt
	call WriteString
	mov ecx,BUFMAX
	mov edx,offset buffer
	call ReadString
	mov bufSize,eax
	call Crlf
	popad
	ret
InputTheString ENDP

DisplayMessage Proc
	pushad
	call WriteString
	mov edx,offset buffer
	call WriteString
	call Crlf
	call Crlf
	popad
	ret
DisplayMessage ENDP

;------------------------------------
;�ַ�����ÿ���ַ�������Կ�ֽڽ������
;ʵ��ת��
;------------------------------------
TranslateBuffer PROC
	pushad
	mov ecx,bufSize
	mov esi,0
L1:	xor buffer[esi],KEY
	inc esi
	loop L1
	popad
	ret
TranslateBuffer ENDP
END main

