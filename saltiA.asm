; selezione in Assembly
.model small
.stack 200h

.data
	n1 db 0                     ; variabile che conterrà il primo valore inserito
	n2 db 0                     ; variabile che conterrà il secondo valore inserito
	
	msg_i db "Inserisci un valore: ",13,10,"$" ; messaggio di input
	
	msg_e db "I valori sono uguali. ",13,10,"$" ; messaggio caso uguaglianza
	
	msg_g db "Il primo valore e' maggiore del secondo. ",13,10,"$" ; messaggio caso maggiore
	
	a_capo db 13,10,"$"         ; stringa per andare a capo

.code
main: 

	mov ax,@data                ; carica l'indirizzo del segmento dati
	mov ds,ax                   ; inizializza il registro DS

	; richiediamo il primo valore 
	mov dx,offset msg_i        ; carica l'indirizzo del messaggio
	mov ah,09h                 ; funzione DOS per stampare stringhe
	int 21h                    ; chiamata al sistema operativo
	
	mov ah,01h                 ; funzione DOS per leggere un carattere da tastiera
	int 21h                    ; il carattere letto viene salvato in AL
	
	mov n1,al                  ; salviamo il valore nella variabile n1

	; stampiamo la variabile a_capo
	mov dx,offset a_capo
	mov ah,09h
	int 21h
	
	; richiediamo il secondo valore 
	mov dx,offset msg_i
	mov ah,09h
	int 21h
	
	mov ah,01h
	int 21h
	
	mov n2,al                  ; salviamo il valore nella variabile n2

	; stampiamo la variabile a_capo
	mov dx,offset a_capo
	mov ah,09h
	int 21h

	; confronto i due valori
	
	mov bl,n2                  ; carichiamo il secondo valore nel registro BL
	cmp bl,n1                  ; confrontiamo BL con n1
	
	je salta                   ; se sono uguali salta a salta
	jg salta_1                 ; se n2 > n1 salta a salta_1

; -------------------------
; caso: n1 > n2
; -------------------------

	mov dx, offset msg_g       ; stampiamo messaggio: primo maggiore
	mov ah,09h
	int 21h
	jmp fine                   ; saltiamo alla fine del programma

; -------------------------
; caso: valori uguali
; -------------------------

salta: 
	mov dx, offset msg_e       ; stampa messaggio di uguaglianza
	mov ah,09h
	int 21h
	jmp fine

; -------------------------
; caso: n2 > n1
; -------------------------

salta_1:
	mov dx, offset a_capo
	mov ah,09h
	int 21h

fine:
	mov ah,4ch                 ; termina il programma
	int 21h

end main