; prodotto tra due numeri
; nel registro al va inserito uno dei due operandi da moltiplicare

.model small
.stack 200h

.data 
    num db 4          ; primo operando (8 bit)
    d db 2            ; secondo operando (8 bit)

    moutput db "Il valore del prodotto e': ",13,10,"$"
    ; Messaggio da stampare
    ; 13 = CR, 10 = LF
    ; '$' = terminatore per funzione 09h

.code 

main: 
    mov ax,@DATA
    mov ds, ax
    ; Inizializzazione del segmento dati

    ; -------- STAMPA MESSAGGIO --------
    lea dx, moutput
    ; Carica in DX l'indirizzo della stringa
    ; LEA = Load Effective Address

    mov ah, 09h
    int 21h
    ; Stampa il messaggio

    ; -------- PREPARAZIONE OPERANDI --------
    mov al, num
    ; Carica il primo operando in AL

    mov bl, d
    ; Carica il secondo operando in BL

    ; -------- MOLTIPLICAZIONE --------
    mul bl
    ; Moltiplica AL * BL
    ; ATTENZIONE:
    ; Con operandi a 8 bit:
    ; AL × BL → risultato a 16 bit in AX
    ; AH = parte alta
    ; AL = parte bassa

    ; In questo caso:
    ; 4 * 2 = 8
    ; AX = 0008h
    ; AH = 00
    ; AL = 08

    ; -------- CONVERSIONE ASCII --------
    add al, 48
    ; Converte il numero in carattere ASCII
    ; 8 (08h) + 30h → 38h → '8'

    ; -------- STAMPA RISULTATO --------
    mov dx, ax
    ; Questo è concettualmente inutile:
    ; La funzione 02h usa DL, non DX intero.
    ; In pratica DL contiene già il carattere corretto
    ; quindi funziona comunque.

    mov ah, 02h
    int 21h
    ; Stampa il carattere contenuto in DL

    ; -------- TERMINAZIONE --------
    mov ah, 4ch
    int 21h

end main