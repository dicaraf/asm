; stampa di un quadrato di asterischi

.model SMALL              ; modello di memoria SMALL: un segmento dati e uno di codice
.stack 200h               ; riserva 200h byte (512 byte) per lo stack

.data                     ; inizio segmento dati
n1 dw 0                   ; variabile di tipo word usata per salvare il contatore del ciclo esterno
a_capo db "",13,10,"$"    ; stringa per andare a capo (CR=13, LF=10) terminata con $

.code                     ; inizio segmento codice
main:                     ; etichetta di ingresso del programma

	mov ax,@data          ; carica in AX l'indirizzo del segmento dati
	mov ds,ax             ; inizializza il registro DS per poter accedere ai dati

	mov cx,04             ; CX = 4 → numero di righe del quadrato (ciclo verticale)

verticale:                ; inizio ciclo esterno (righe del quadrato)

	mov n1,cx             ; salva il valore di CX nella variabile n1
	                      ; serve perché CX verrà riutilizzato nel ciclo interno

	mov cx,04             ; CX = 4 → numero di colonne del quadrato (ciclo orizzontale)

orizzontale:              ; inizio ciclo interno (stampa dei caratteri sulla riga)

	mov dl,42d            ; DL = 42 → codice ASCII del carattere '*'
	mov ah,02h            ; funzione DOS 02h → stampa un carattere contenuto in DL
	int 21h               ; chiamata all'interrupt DOS per stampare '*'

	mov dl,' '            ; carica in DL il carattere spazio
	mov ah,02h            ; funzione DOS 02h → stampa un carattere
	int 21h               ; stampa uno spazio per separare gli asterischi

	LOOP orizzontale      ; decrementa CX e ripete il ciclo finché CX ≠ 0

	lea dx,a_capo         ; carica in DX l'indirizzo della stringa per andare a capo
	mov ah,09h            ; funzione DOS 09h → stampa stringa terminata da $
	int 21h               ; stampa il ritorno a capo

	mov cx,n1             ; ripristina in CX il valore salvato del ciclo verticale

	LOOP verticale        ; decrementa CX e ripete il ciclo delle righe finché CX ≠ 0

	mov ah,4ch            ; funzione DOS 4Ch → terminazione del programma
	int 21h               ; ritorna al sistema operativo

end main                 ; indica all'assembler che l'esecuzione parte da main