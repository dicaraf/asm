.model small
.stack 200h

.data
    n db 0 ; contiene il valore incrementato

    msg db "Inserisci un valore: ",13,10,"$"
    ; Stringa di richiesta
    ; 13 = Carriage Return (CR)
    ; 10 = Line Feed (LF)
    ; '$' = terminatore richiesto dalla funzione 09h

    msg_o db "Il valore incrementato vale: ",13,10,"$"
    ; Messaggio per stampare il risultato

    a_capo db "",13,10,"$"
    ; Stringa che serve solo per andare a capo

.code
main:

    mov ax,@data
    mov ds,ax
    ; Inizializzazione del segmento dati

    ; -------- STAMPA RICHIESTA --------
    mov dx, offset msg
    mov ah,09h
    int 21h
    ; Stampa "Inserisci un valore:"

    ; -------- LETTURA CARATTERE --------
    mov ah,01h
    int 21h
    ; Legge un carattere da tastiera
    ; Lo stampa automaticamente (echo)
    ; Il valore ASCII viene messo in AL

    ; -------- INCREMENTO --------
    inc al
    ; Incrementa il contenuto di AL di 1
    ; ATTENZIONE: sta incrementando il codice ASCII,
    ; non il numero puro

    mov n,al
    ; Salva il nuovo valore nella variabile n

    ; -------- ANDATA A CAPO --------
    mov dx, offset a_capo
    mov ah,09h
    int 21h

    ; -------- STAMPA MESSAGGIO RISULTATO --------
    mov dx, offset msg_o
    mov ah,09h
    int 21h

    ; -------- STAMPA VALORE INCREMENTATO --------
    mov dl,n
    ; Copia il contenuto di n in DL

    mov ah,02h
    int 21h
    ; Stampa il carattere contenuto in DL

    ; -------- TERMINAZIONE --------
    mov ah,4ch
    int 21h

end main