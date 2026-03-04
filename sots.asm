;DATI DUE VAORI ESGUIRE LA DIFFERENZA TRA IL 
;MAGGIORE E IL MINORE E AUMENTARLO DI UNO(INC var)
.model small
.stack 200h
.data
	n1 db 0
	n2 db 0
	msg_i db "Inserisci un valore: ",13,10,"$"
	msg_o db "La differenza incrementata di uno vale: ",13,10,"$"
	a_capo db "",13,10,"$"
.code
main: 
	mov ax,@data
	mov ds,ax
	;richiediamo il primo valore 
	mov dx,offset msg_i
	mov ah,09h
	int 21h
	mov ah,01h
	int 21h
	mov n1,al
	;stampiamo la variabile a_capo
	mov dx,offset a_capo
	mov ah,09h
	int 21h
	;richiediamo il secondo valore 
	mov dx,offset msg_i
	mov ah,09h
	int 21h
	mov ah,01h
	int 21h
	mov n2,al
	;stampiamo la variabile a_capo
	mov dx,offset a_capo
	mov ah,09h
	int 21h
	;confronto i due valori
	mov dx,offset msg_o
	mov ah,09h
	int 21h
	mov bl,n1
	cmp bl,n2
	jg maggiore
	sub n2,bl
	inc n2
	mov dl,n2
	add dl,48
	mov ah,02h
	int 21h	
	jmp fine
maggiore:
	sub bl,n2
	inc bl
	mov dl,bl
	add dl,48
	mov ah,02h
	int 21h
fine:		
	mov ah,4ch
	int 21h
end main