


[BITS 16]

boot: ; This file starts executing here.
;main:
;	mov ah, 0x0e
;	xor bh,bh
;	mov bl,7
;	mov al,'N'
;	int 16
;loop:
;	jmp loop
main:
	mov al, 'N'
	call printChar
	move al, 'E'
	call printChar
	mov al, 'I'
	call printChar
	mov al 'L'
	call printChar
loop:
	jmp loop

;add2nums:
;	push bp
;	mov bp,sp
;	mov ax,[bp+6]
;	mov bx,[bp+4]
;	add ax,bx
;	pop bp
;	ret
printChar:
	mov ah, 0x0e ; Below insructions set up the page so it can print al there
	xor bh, bh
	mov bl, 7
	;int 16 call the BIOS? Do I need this?	
	ret
    hlt
times 510-($-$$) db 0 ; Skip to end of boot sector

db 0x55 ; Magic Numbers
db 0xaa ; To make disk bootable

