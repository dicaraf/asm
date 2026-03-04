; divisione tra due numeri con divisore a 8 bit
; div bl   ------> ax:bl  
; il resto va in ah
; il quoziente va in al

.model small
.stack 200h

.data 
    moutput db "Il valore della divisione vale: ",13,10,"$"
    ; Messaggio da stampare
    ; 13 = CR, 10 = LF
    ; '$' = terminatore per funzione 09h

.code 

main: 
    mov ax,@DATA
    mov ds, ax
    ; Inizializzazione segmento dati

    ; -------- STAMPA MESSAGGIO --------
    lea dx, moutput
    mov ah, 09h
    int 21h
    ; Stampa il messaggio

    ; -------- PREPARAZIONE DIVISIONE --------
    mov ax,04h
    ; Carica 0004h in AX
    ; AX è il dividendo a 16 bit

    mov bl,02h
    ; BL è il divisore (8 bit)

    div bl
    ; Divisione NON signed
    ; Con divisore a 8 bit:
    ;
    ; AX / BL
    ;
    ; Quoziente → AL
    ; Resto     → AH
    ;
    ; In questo caso:
    ; 4 / 2 = 2
    ; Quoziente = 2 → AL
    ; Resto = 0 → AH

    ; -------- CONVERSIONE ASCII --------
    add al, 48d
    ; Converte il numero in carattere ASCII
    ; 2 + 48 → '2'

    mov dl, al
    ; DL = carattere da stampare

    mov ah, 02h
    int 21h
    ; Stampa il carattere contenuto in DL

    ; -------- TERMINAZIONE --------
    mov ah, 4ch
    int 21h

end main