;���ݴ���ʾ��
.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
val1 WORD 1000h
val2 WORD 2000H
arrayB BYTE 10h,20h,30h,40h,50h
arrayW WORD 100h,200h,300h
arrayD DWORD 10000h,20000h

.code
main proc
;��ʾmovzxָ��
	mov		bx,0
	mov		bx,0a69bh
	movzx	eax,bx
	movzx	edx,bl
	movzx	cx,bl
;��ʾmovsxָ��
	mov		bx,0a69bh
	movsx	eax,bx
	movsx	edx,bl
	mov		bl,7bh
	movsx	cx,bl
;�ڴ�-�ڴ�Ľ���
	mov		ax,val1
	xchg	ax,val2
	mov		val1,ax
;ֱ��-ƫ����Ѱַ���ֽ����飩
	mov		al,arrayB
	mov		al,[arrayB+1]
	mov		al,[arrayB+2]
;ֱ��-ƫ����Ѱַ�������飩
	mov		ax,arrayW
	mov		ax,[arrayW+2]
;ֱ��-ƫ����Ѱַ(˫������)
	mov		eax,arrayD
	mov		eax,[arrayD+4]
	mov		eax,[arrayD+4]

	INVOKE	ExitProcess,0

main ENDP
END	 main

