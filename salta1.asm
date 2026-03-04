; Stampare 5 volte il valore 1
.model small
.stack 200h
.data 
	a_capo db "",13,10,"$"
.code
main:
	mov ax,@data
	mov ds,ax
	;inizializzo il registro cx
	mov cx,05
salta:
	mov dl,01
	add dl,48d
	mov ah,02h
	int 21h
	mov dx,offset a_capo
	mov ah,09h
	int 21h
	LOOP salta
	
	mov ah,4ch
	int 21h
end main