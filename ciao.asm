;VISUALIZZARE A SCHERMO "CIAO"
.model small
.stack 200h
.data
	car db 3
.code
main:
	mov ax,@data
	mov ds,ax
	
	mov dl, car ;C
	add dl, 64d	
	mov ah,02h
	int 21h
	
	mov dl, car ;I
	add dl, 70d	
	mov ah,02h
	int 21h
	
	mov dl, car ;A
	add dl, 62d	
	mov ah,02h
	int 21h
	
	mov dl, car ;0
	add dl, 76d	
	mov ah,02h
	int 21h
	
	mov ah,4ch
	int 21h
end main