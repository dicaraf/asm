; DATI DUE VALORI ESEGUIRE LA DIFFERENZA TRA IL 
; MAGGIORE E IL MINORE E AUMENTARLO DI UNO (INC var)

.model small
; Modello di memoria small:
; un segmento per il codice e uno per i dati

.stack 200h
; Riserva 200h byte (512 byte) per lo stack

.data
    n1 db 0
    ; variabile che conterrà il primo valore inserito

    n2 db 0
    ; variabile che conterrà il secondo valore inserito

    msg_i db "Inserisci un valore: ",13,10,"$"
    ; messaggio di input
    ; 13 = carriage return
    ; 10 = line feed

    msg_o db "La differenza incrementata di uno vale: ",13,10,"$"
    ; messaggio che precede il risultato

    a_capo db "",13,10,"$"
    ; stringa per andare a capo

.code

main: 

    mov ax,@data
    mov ds,ax
    ; inizializzazione del segmento dati

    ; -------- LETTURA PRIMO VALORE --------
    mov dx,offset msg_i
    ; carica in DX l'indirizzo del messaggio

    mov ah,09h
    ; funzione DOS per stampare una stringa

    int 21h
    ; stampa il messaggio

    mov ah,01h
    ; funzione DOS per leggere un carattere da tastiera
    ; il carattere viene salvato in AL

    int 21h

    mov n1,al
    ; salva il carattere letto nella variabile n1

    ; -------- A CAPO --------
    mov dx,offset a_capo
    mov ah,09h
    int 21h
    ; stampa un ritorno a capo

    ; -------- LETTURA SECONDO VALORE --------
    mov dx,offset msg_i
    mov ah,09h
    int 21h
    ; stampa di nuovo il messaggio

    mov ah,01h
    int 21h
    ; legge il secondo carattere

    mov n2,al
    ; salva il valore in n2

    ; -------- A CAPO --------
    mov dx,offset a_capo
    mov ah,09h
    int 21h

    ; -------- STAMPA MESSAGGIO RISULTATO --------
    mov dx,offset msg_o
    mov ah,09h
    int 21h

    ; -------- CONFRONTO TRA I DUE VALORI --------
    mov bl,n1
    ; copia n1 nel registro BL

    cmp bl,n2
    ; confronta n1 con n2

    jg maggiore
    ; se n1 > n2 salta all'etichetta "maggiore"

    ; -------- CASO n2 >= n1 --------
    sub n2,bl
    ; calcola n2 - n1 (differenza tra maggiore e minore)

    inc n2
    ; incrementa il risultato di 1

    mov dl,n2
    ; prepara il risultato per la stampa

    add dl,48
    ; conversione da numero a carattere ASCII

    mov ah,02h
    int 21h
    ; stampa il risultato

    jmp fine
    ; salta alla fine del programma

maggiore:

    ; -------- CASO n1 > n2 --------
    sub bl,n2
    ; calcola n1 - n2

    inc bl
    ; incrementa il risultato di 1

    mov dl,bl
    ; prepara il risultato per la stampa

    add dl,48
    ; conversione ASCII

    mov ah,02h
    int 21h
    ; stampa il risultato

fine:        

    ; -------- TERMINAZIONE PROGRAMMA --------
    mov ah,4ch
    int 21h

end main