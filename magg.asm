; stampare il valore maggiore

.model small
.stack 200h

.data
    n db 0
    n1 db 0
    ; Variabili che conterranno i due valori inseriti

    msg db "Inserisci un valore: ",10,13,"$"
    ; Messaggio di richiesta
    ; 10 = LF, 13 = CR
    ; '$' = terminatore per funzione 09h

    msg_o db "Il valore magggiore risulta: ",10,13,"$"
    ; Messaggio per stampare il risultato

    a_capo db "",13,10,"$"
    ; Stringa usata per andare a capo

.code
main:

    mov ax,@data
    mov ds,ax
    ; Inizializza il segmento dati

    ; -------- PRIMO VALORE --------
    mov dx,offset msg
    mov ah,09h
    int 21h
    ; Stampa la richiesta

    mov ah,01h
    int 21h
    ; Legge un carattere da tastiera (con echo)
    ; Il codice ASCII viene messo in AL

    mov n,al
    ; Salva il primo valore (ASCII) in n

    mov dx,offset a_capo
    mov ah,09h
    int 21h
    ; Va a capo

    ; -------- SECONDO VALORE --------
    mov dx,offset msg
    mov ah,09h
    int 21h
    ; Stampa di nuovo la richiesta

    mov ah,01h
    int 21h
    ; Legge il secondo carattere

    mov n1,al
    ; Salva il secondo valore (ASCII) in n1

    mov dx,offset a_capo
    mov ah,09h
    int 21h
    ; Va a capo

    ; -------- CONFRONTO --------

    mov dx,offset msg_o
    mov ah,09h
    int 21h
    ; Stampa il messaggio del risultato

    mov bl,n
    ; Copia il primo valore in BL

    cmp bl,n1
    ; Confronta BL con n1
    ; Internamente fa: BL - n1
    ; Aggiorna i flag (ZF, SF, OF, ecc.)

    jg maggiore
    ; Salta all'etichetta "maggiore"
    ; se BL > n1 (confronto signed)

    ; Se non salta:
    mov dl,n1
    mov ah,02h
    int 21h
    ; Stampa il secondo valore (perché è maggiore o uguale)

    jmp fine
    ; Salta alla fine per evitare di eseguire il blocco "maggiore"

maggiore:
    mov dl,n
    mov ah,02h
    int 21h
    ; Stampa il primo valore (perché è maggiore)

fine:
    mov ah,4ch
    int 21h
    ; Termina il programma

end main