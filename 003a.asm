;sommare due valori uno dei quali 
;richiesto dall'utente
.model small
.stack 200h
.data
	num db 3
	num1 db 0
	msg db "Inserisci un valore: ",13,10,"$"   ;'Inserisci un valore: $'
.code
main:
	mov ax,@data
	mov ds,ax
	
	lea dx,msg ;mov dx,offset msg
	mov ah,09h
	int 21h
	
	mov ah,08h; acquisiamo il carattere da tastiera 
	int 21h
	; il carattere viene memorizzato in al
	mov num1,al
	
	mov dl,num
	add dl,num1
	mov ah,02h ;stampa char
	int 21h
	mov ah,4ch
	int 21h
end main