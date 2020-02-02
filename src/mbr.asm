


[BITS 16]

boot: ;This file starts executing here.

main:
	mov ah, 0x0e
	xor bh,bh
	mov bl, 7

	mov bx, WELCOME ;put string in ax because its a string not a character
	call putStr
	;mov ah, 80 ;where it needs to go to start reading from the sectors?
	;call readSector
	;jmp 0x7E00 ;then jump to 7E00(from instructions
loop:
	jmp loop

WELCOME:
	db 'welcome',0
putStr:
	mov al,[bx] ;calls the BIOS
	cmp al, 0
	jne moveForward	
	ret
;readSector:
	;mov bx, 0x7E00: ;Memory adress = 0x7E00
	;mov es, bx
	;mov bx, 0 start to read into this
	;mov ah, 2h ; BIOS read sector
	;mov al, 80 ;read 50 sectors or so
	;mov ch, 1 ;track
	;mov cl, 2 ;sector after mbr
	;mov dh, 1 ;drive head
	;mov dl, 0 ;drive you're reading
	;int 0x13 ;from Ralf's interrupt list
	;ret

moveForward:;moves one space forward in character
	mov al,[bx]
	int 0x10
	add bx, 1
	jmp putStr
hlt
times 510-($-$$) db 0 ;Skip to end of boot sector

db 0x55 ; Magic Numbers
db 0xaa ; To make disk bootable

