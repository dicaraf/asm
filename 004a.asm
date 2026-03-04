;sommare due valori richiesti da tastiera
.model small
.stack 200h
.data
	msg_i db "Inserisci un valore: ",13,10,"$"
	msg_o db "La somma vale: ",13,10,"$"
	n1 db 0
	n2 db 0
.code
main:
	mov ax,@data
	mov ds,ax
	;stampa del messaggio di inserimento 1° valore
	lea dx,msg_i
	mov ah,09h
	int 21h
	;acquisire il valore da tastiera
	mov ah,01h
	int 21h
	mov n1,al   ;memorizzo il primo valore in n1
	
	;stampa del messaggio di inserimento 2° valore
	lea dx,msg_i
	mov ah,09h
	int 21h
	;acquisire il valore da tastiera
	mov ah,01h
	int 21h
	mov n2,al   ;memorizzo il secondo valore in n2
	;sommiamo i due valori
	mov dl,n1
	add dl,n2
	mov ah,02h
	int 21h
	
	mov ah,4ch
	int 21h
end main