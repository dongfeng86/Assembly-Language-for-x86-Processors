; AddVariables.asm - adds two 32-bit integers.
; Chapter 3 example

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword


.data
firstval	dword 20002000h
secondval	dword 11111111h
thirdval	dword 22222222h
sum			dword 0

.code
main proc
	mov	eax,firstval			
	add	eax,secondval
	add eax,thirdval
	mov sum,eax			

	count=5
	mov eax,count
	count = 10
	mov eax , count	

	invoke ExitProcess,0
main endp
end main