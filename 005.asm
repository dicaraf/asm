; risolvere l'espressione 9 - (4 -3)
.model small
.stack 200h
.data
	n1 db 9
	n2 db 4
	n3 db 3
.code
main: 
	mov ax,@data
	mov ds,ax
	
	mov al,n2
	sub al,n3
	
	mov bl,n1
	sub bl,al 
	
	add bl,48d
	mov dl,bl
	
	mov ah,02h
	int 21h
	
	
	
	
	
	
	
	
	
	
	
	mov ah,4ch
	int 21h
	
	
end main

