; determinare se un numero tra 0 e 9 è pari o dispari

.model small
.stack 200h

.data
	msg_i db "Inserisci un numero tra 0 e 9: ",13,10,"$"
	msg_p db "Il numero e' pari.",13,10,"$"
	msg_d db "Il numero e' dispari.",13,10,"$"

.code
main:

	mov ax,@data          ; inizializza il segmento dati
	mov ds,ax

	; stampiamo il messaggio di richiesta input
	mov dx,offset msg_i
	mov ah,09h            ; funzione DOS per stampare una stringa
	int 21h

	; lettura di un carattere da tastiera
	mov ah,01h            ; funzione DOS per leggere un carattere
	int 21h               ; il carattere letto viene salvato in AL

	sub al,48             ; conversione da ASCII a numero (es. '5' -> 5)

	; verifichiamo se il numero è pari o dispari
	mov bl,2              ; carichiamo il divisore 2 nel registro BL
	div bl                ; divisione AL / BL
	                       ; quoziente -> AL
	                       ; resto -> AH

	cmp ah,0              ; confrontiamo il resto con 0
	je pari               ; se il resto è 0 il numero è pari

; -----------------------
; caso numero dispari
; -----------------------

	mov dx,offset msg_d   ; stampa messaggio "dispari"
	mov ah,09h
	int 21h
	jmp fine              ; salta alla fine del programma

; -----------------------
; caso numero pari
; -----------------------

pari:
	mov dx,offset msg_p   ; stampa messaggio "pari"
	mov ah,09h
	int 21h

fine:
	mov ah,4ch            ; termina il programma
	int 21h

end main