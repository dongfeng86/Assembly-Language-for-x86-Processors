;计算二维数组的某行的和
include Irvine32.inc

.data
tableB	byte 10h,20h,30h,40h,50h
RowSize=($-tableB)
		byte 60h,70h,80h,90h,0a0h
		byte 0b0h,0c0h,0d0h,0e0h,0f0h

.code
main proc
	mov ebx,offset tableB
	mov eax,1
	mov ecx,RowSize
	call calc_row_sum
	
	exit	
main endp

calc_row_sum proc uses ebx ecx edx esi
;计算字节矩阵中一行的和数
;参数：ebx=表偏移量,eax=行索引
;ecx=按字节计的行大小
;返回：eax为和数
	mul ecx
	add ebx,eax
	mov eax,0
	mov esi,0
L1:	movzx edx,byte ptr [ebx + esi* type tableB]
	add eax,edx
	inc esi
	loop L1
	
	ret
calc_row_sum endp

end main
