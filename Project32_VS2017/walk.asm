include Irvine32.inc
WalkMax=50
StartX=25
StartY=25

DrunkardWalk struct
	path COORD WalkMax DUP(<0,0>)
	pathsUsed WORD 0
DrunkardWalk ENDS

DisplayPosition proto currX:word,currY:word

.data
aWalk DrunkardWalk <>
array22 DrunkardWalk 20 dup(<>)	;则会个地方不知道为什么，总是编译不过去

.code
main proc
	mov esi,offset aWalk
	call TakeDrunkenWalk
	exit
main endp

TakeDrunkenWalk proc
	local currX:word,curry:word
;向随机方向行走
;参数：esi位TakeDrunkenWalk结构的指针
;返回：结构初始化为随机数
	pushad
	mov edi,esi
	add edi,offset DrunkardWalk.path
	mov ecx,WalkMax		;循环计数器
	mov currX,StartX	;当前x的位置
	mov currY,StartY	;当前y的位置
Again:
	;把当前位置插入数组
	mov ax,currX
	mov (COORD PTR [edi]).X,ax
	mov ax,currY
	mov (COORD PTR [edi]).y,ax
	
	invoke DisplayPosition,currX,currY

	mov eax,4
	call RandomRange
	
	.IF eax==0
		dec CurrY
	.ELSEIF eax==1
		inc CurrY
	.ELSEIF eax==2
		dec currX
	.ELSE
		inc currX
	.ENDIF
	
	add edi,type COORD
	loop Again

Finish:
	mov (DrunkardWalk ptr [esi]).pathsUsed,WalkMax
	popad
	ret
TakeDrunkenWalk endp

DisplayPosition proc currX:word,currY:word
.data
commaStr byte ",",0
.code
	pushad
	movzx eax,currX
	call WriteDec
	mov edx,offset commaStr
	call WriteString
	movzx eax,CurrY
	call WriteDec
	call Crlf
	popad
	ret
DisplayPosition endp	

end main