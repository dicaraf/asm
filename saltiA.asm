; selezione in Assembly
.model small
.stack 200h
.data
	n1 db 0
	n2 db 0
	msg_i db "Inserisci un valore: ",13,10,"$"
	msg_e db "I valori sono uguali. ",13,10,"$"
	msg_g db "Il primo valore è\' maggiore del secondo. ",13,10,"$"
	a_capo db 13,10,"$"
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
	; confronto i due valori
	mov bl,n2
	cmp bl,n1
	je salta
	jg salta_1
salta: 
	mov dx, offset msg_e
	mov ah,09h
	int 21h
salta_1:
	
	
	
	
	mov ah,4ch
	int 21h
end main