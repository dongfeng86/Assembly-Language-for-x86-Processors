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
	call InputTheString		;输入明文
	call TranslateBuffer	;加密缓冲区
	mov edx,offset sEncrypt	;显示加密消息
	call DisplayMessage
	call TranslateBuffer	;解密缓冲区
	mov edx,offset sDecrypt	;显示解密消息
	call DisplayMessage
	exit
main ENDP

;-------------------------------------
;提示用户输入一个纯文本字符串
;保存字符串和它的长度
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
;字符串的每个字符都与密钥字节进行异或
;实现转换
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

