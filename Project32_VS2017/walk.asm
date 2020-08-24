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
array22 DrunkardWalk 20 dup(<>)	;�����ط���֪��Ϊʲô�����Ǳ��벻��ȥ

.code
main proc
	mov esi,offset aWalk
	call TakeDrunkenWalk
	exit
main endp

TakeDrunkenWalk proc
	local currX:word,curry:word
;�������������
;������esiλTakeDrunkenWalk�ṹ��ָ��
;���أ��ṹ��ʼ��Ϊ�����
	pushad
	mov edi,esi
	add edi,offset DrunkardWalk.path
	mov ecx,WalkMax		;ѭ��������
	mov currX,StartX	;��ǰx��λ��
	mov currY,StartY	;��ǰy��λ��
Again:
	;�ѵ�ǰλ�ò�������
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