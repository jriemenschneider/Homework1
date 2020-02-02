


[BITS 16]

boot: ;This file starts executing here.

main:
	mov ah, 0x0e
	xor bh,bh
	mov bl, 7

	mov bx, WELCOME
	call putStr
	mov dh, 50 ;needs to read 50 sectors
	mov dl, 0
	mov bx, 0x7E00 ;memory address
	call readSector
	jmp 0x7E00 ;then jump to 7E00(from instructions)

WELCOME:
	db 'welcome',0
putStr:
	mov al,[bx]
	cmp al, 0 ;when it reaches end of null terminated string,0, it stops
	jne moveForward	;moves it forward one character in the string at a time
	ret
readSector:
	mov ah, 0x02 ; BIOS read sector
	mov al, dh ;read 50 sectors or so which is held in dh(in main)
	mov ch, 0x00
	mov cl, 0x02 ;sector after mbr
	mov dh, 0x00
	mov dl, 0x80
	mov bx, 0x7E00
	int 0x13 ;from Ralf's interrupt list
	ret

moveForward:;moves one character forward in string, then runs the same process on the new character in putStr
	mov al,[bx]
	int 0x10
	add bx, 1
	jmp putStr
hlt
times 510-($-$$) db 0 ;Skip to end of boot sector

db 0x55 ; Magic Numbers
db 0xaa ; To make disk bootable

