; risolvere l'espressione 9 - (4 - 3)

.model small
; Modello di memoria small:
; un segmento per il codice e uno per i dati

.stack 200h
; Riserva 200h byte (512 byte) per lo stack

.data
    n1 db 9
    ; primo valore dell'espressione

    n2 db 4
    ; primo valore della sottrazione tra parentesi

    n3 db 3
    ; secondo valore della sottrazione tra parentesi

.code
main: 

    mov ax,@data
    mov ds,ax
    ; Inizializza il segmento dati

    ; -------- CALCOLO (4 - 3) --------
    mov al,n2
    ; AL = 4

    sub al,n3
    ; AL = 4 - 3 = 1
    ; AL ora contiene il risultato della parentesi

    ; -------- CALCOLO 9 - (risultato) --------
    mov bl,n1
    ; BL = 9

    sub bl,al
    ; BL = 9 - 1 = 8
    ; BL ora contiene il risultato finale

    ; -------- CONVERSIONE IN ASCII --------
    add bl,48d
    ; Converte il numero in carattere ASCII
    ; 8 + 48 = '8'

    mov dl,bl
    ; Copia il carattere da stampare in DL
    ; la funzione 02h usa DL

    ; -------- STAMPA DEL RISULTATO --------
    mov ah,02h
    ; Funzione DOS per stampare un carattere

    int 21h
    ; Stampa il carattere contenuto in DL

    ; -------- TERMINAZIONE PROGRAMMA --------
    mov ah,4ch
    ; Funzione DOS per terminare il programma

    int 21h

end main