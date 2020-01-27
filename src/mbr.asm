


[BITS 16]

boot: ; This file starts executing here.
main: ;need to edit this still from printChar
	mov al, 'N'
	call putStr
	move al, 'E'
	call printChar
	mov al, 'I'
	call printChar
	mov al 'L'
	call printChar
loop:
	jmp loop
;printChar: PRACTICE FOR PUSHING WITH GIT
;	mov ah, 0x0e ; Below insructions set up the page so it can print al there
;	xor bh, bh
;	mov bl, 7
;	int 16 call the BIOS	
;	ret
putStr:
	;Null terminated string is going to look like  'J''a''i''m''i'e''\0'
	int 16 ;calls the BIOS
	ret
    hlt
times 510-($-$$) db 0 ; Skip to end of boot sector

db 0x55 ; Magic Numbers
db 0xaa ; To make disk bootable

