;��ʾMessageBoxA
include Irvine32.inc

.data
captionW	byte "Warning",0
warningMsg	byte "The current operation may take years "
			byte "to complete.",0

captionQ	byte "Question",0
questionMsg	byte "A matching user account was not found."
			byte 0dh,0ah,"Do you wish to continue?",0

captionC	byte "Information",0
infoMsg		byte "Select yes to save a backup file "
			byte "before continuing,",0dh,0ah
			byte "or click cancel to stop the operation",0

captionH	byte "Cannot view user list",0
haltMsg		byte "This operation not supported by your"
			byte " user accout.",0

.code
main proc
	;��ʾ��̾��ͼ���ok��ť
	invoke MessageBox,
			NULL,
			addr warningMsg,
			addr captionW,
			MB_OK+MB_ICONEXCLAMATION

	;��ʾ�ʺ�ͼ���YES/NO��ť
	invoke MessageBox,
			NULL,
			addr questionMsg,
			addr captionQ,
			MB_YESNO+MB_ICONQUESTION

	cmp eax,IDYES
	;��ʾ��Ϣͼ���YES/NO/Cancel��ť
	invoke MessageBox,
			NULL,
			addr infoMsg,
			addr captionC,
			MB_YESNOCANCEL+MB_ICONINFORMATION	\
			+MB_DEFBUTTON2

	;��ʾֹͣͼ���OK��ť
	invoke MessageBox,
			NULL,
			addr haltMsg,
			addr captionH,
			MB_OK+MB_ICONSTOP

	exit
main endp

end main