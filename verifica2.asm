; programma che verifica se il carattere inserito è una consonante
; funziona con lettere maiuscole e minuscole
; controlla anche che il carattere sia compreso tra A-Z o a-z

.model small
.stack 200h

.data
    msg db "Inserisci una lettera: $"
    consonante db 13,10,"La lettera e' una CONSONANTE$"
    vocale db 13,10,"La lettera e' una VOCALE$"
    nonlettera db 13,10,"Il carattere inserito NON e' una lettera$"

.code
main:

    mov ax,@data          ; carica l'indirizzo del segmento dati
    mov ds,ax             ; inizializza il registro DS

; -------- richiesta input --------

    lea dx,msg            ; carica l'indirizzo del messaggio
    mov ah,09h            ; funzione DOS 09h -> stampa stringa
    int 21h               ; stampa il messaggio

    mov ah,01h            ; funzione DOS 01h -> lettura carattere da tastiera
    int 21h               ; il carattere letto viene salvato in AL

; -------- verifica se è lettera maiuscola --------

    cmp al,'A'            ; confronta con 'A'
    jb controlla_minuscola ; se AL < 'A' non può essere lettera maiuscola

    cmp al,'Z'            ; confronta con 'Z'
    jbe converti_minuscola ; se AL <= 'Z' è una lettera maiuscola

; -------- verifica se è lettera minuscola --------

controlla_minuscola:

    cmp al,'a'            ; confronta con 'a'
    jb non_lettera        ; se AL < 'a' non è lettera

    cmp al,'z'            ; confronta con 'z'
    ja non_lettera        ; se AL > 'z' non è lettera

    jmp controlla_vocale  ; se arriva qui è una lettera minuscola

; -------- conversione maiuscola -> minuscola --------

converti_minuscola:

    add al,32             ; converte A-Z in a-z (ASCII differenza 32)

; -------- controllo vocali --------

controlla_vocale:

    cmp al,'a'            ; controlla se è 'a'
    je stampa_vocale

    cmp al,'e'            ; controlla se è 'e'
    je stampa_vocale

    cmp al,'i'            ; controlla se è 'i'
    je stampa_vocale

    cmp al,'o'            ; controlla se è 'o'
    je stampa_vocale

    cmp al,'u'            ; controlla se è 'u'
    je stampa_vocale

; -------- se non è vocale è consonante --------

    lea dx,consonante     ; carica messaggio consonante
    mov ah,09h            ; funzione stampa stringa
    int 21h               ; stampa il messaggio
    jmp fine              ; salta alla fine

; -------- stampa vocale --------

stampa_vocale:

    lea dx,vocale         ; carica messaggio vocale
    mov ah,09h            ; funzione stampa stringa
    int 21h               ; stampa il messaggio
    jmp fine

; -------- carattere non valido --------

non_lettera:

    lea dx,nonlettera     ; carica messaggio errore
    mov ah,09h            ; funzione stampa stringa
    int 21h               ; stampa il messaggio

fine:

    mov ah,4ch            ; funzione DOS 4Ch -> terminazione programma
    int 21h               ; ritorna al sistema operativo

end main