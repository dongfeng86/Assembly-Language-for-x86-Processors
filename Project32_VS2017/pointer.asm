;使用指针

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

;创建用户定义类型
PBYTE	TYPEDEF PTR BYTE		;字节指针
PWORD	TYPEDEF PTR WORD		;字指针
PDWORD	TYPEDEF	PTR	DWORD		;双字指针

.data
arraryB byte 10h,20h,30h
arraryW	word 1,2,3
arraryD DWORD 4,5,6

;创建几个指针变量
ptr1 PBYTE arraryB
ptr2 PWORD arraryW
ptr3 PDWORD arraryD

.code
main PROC
	;使用指针访问数据
	mov esi,ptr1
	mov al,[esi]
	mov esi,ptr2
	mov ax,[esi]
	mov esi,ptr3
	mov eax,[esi]
	invoke ExitProcess,0
main ENDP
END main