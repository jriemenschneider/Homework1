


[BITS 16]

boot: ; This file starts executing here.
main: ;need to edit this still from printChar
	mov ah, 0x0e
	xor bh, bh
	mov bl, 7
	mov ax, welcomeString ;put string in ax because its a string not a character
	call putStr
loop:
	jmp loop

welcomeString:
	dp 'welcome', 0
putStr:
	;Null terminated string is going to look like  'J''a''i''m''i'e''\0'
	mov ax, [bx] ;calls the BIOS
	cmp ax, 0
	jne moveForward	
	ret
;readSector:

moveForward:;moves one space forward in character
	mov ax, [bx]
	int 0x10
	add bx, 1
	jmp putStr
    hlt
times 510-($-$$) db 0 ;Skip to end of boot sector

db 0x55 ; Magic Numbers
db 0xaa ; To make disk bootable

