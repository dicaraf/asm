; dati due valori inseriti da tastiera 
; eseguire la loro somma e la loro differenza

.model small              ; Modello di memoria small (1 segmento dati, 1 segmento codice)

.stack 200h               ; Riserva 200h byte (512 byte) per lo stack

.data                     ; Inizio segmento dati

    msg db 'Inserisci un valore: $' ; Stringa da stampare
                                     ; Terminata con '$' per la funzione DOS 09h

    n1 db 0               ; Prima variabile (1 byte)
    n2 db 0               ; Seconda variabile (1 byte)

.code                     ; Inizio segmento codice

main: 

    mov ax,@data          ; Carica in AX l'indirizzo del segmento dati
    mov ds,ax             ; Inizializza DS per accedere alle variabili

    ; ---- Stampa messaggio richiesta primo valore ----
    mov dx, offset msg    ; DX = indirizzo della stringa msg
    mov ah,09h            ; Funzione DOS 09h → stampa stringa
    int 21h               ; Stampa "Inserisci un valore: "

    ; ---- Lettura di un carattere da tastiera ----
    mov ah,08h            ; Funzione DOS 08h → legge un carattere da tastiera
                          ; Non stampa il carattere digitato (no echo)
    int 21h               ; Il carattere letto viene messo in AL

    ; in AL ho il dato inserito da tastiera

    mov n1,al             ; Memorizza il carattere letto nella variabile n1
                          ; ATTENZIONE: è un codice ASCII, non un numero puro

    ; ---- Vado a capo ----
    mov dl,10             ; 10 = Line Feed (LF)
    mov ah,02h            ; Funzione DOS 02h → stampa carattere in DL
    int 21h

    mov dl,13             ; 13 = Carriage Return (CR)
    mov ah,02h 
    int 21h               ; Ora il cursore va alla riga successiva

    ; ---- Richiesta del secondo valore ----
    mov dx, offset msg    ; Ricarica l'indirizzo del messaggio
    mov ah,09h
    int 21h               ; Stampa di nuovo "Inserisci un valore: "

    mov ah,01h
    int 21h

    sub al,30h
    mov n2,al

    ; -------- CALCOLO SOMMA --------
    mov al,n1
    add al,n2           ; AL = n1 + n2

    mov bl,al           ; salvo risultato in BL

    ; -------- STAMPA SOMMA --------
    mov dx, offset msgS
    mov ah,09h
    int 21h

    add bl,30h          ; numero → ASCII
    mov dl,bl
    mov ah,02h
    int 21h

    ; -------- CALCOLO DIFFERENZA --------
    mov al,n1
    sub al,n2           ; AL = n1 - n2

    mov bl,al

    ; -------- STAMPA DIFFERENZA --------
    mov dx, offset msgD
    mov ah,09h
    int 21h

    add bl,30h          ; numero → ASCII
    mov dl,bl
    mov ah,02h
    int 21h

    ; -------- FINE PROGRAMMA --------
    mov ah,4ch
    int 21h

end main