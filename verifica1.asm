; programma che calcola: n1 * (n2 - n3)
; poi comunica se il risultato è pari o dispari

.model small
.stack 200h

.data
    msg1 db "Inserisci n1 (0-9): $"
    msg2 db 13,10,"Inserisci n2 (0-9): $"
    msg3 db 13,10,"Inserisci n3 (0-9): $"

    pari db 13,10,"Il risultato e' PARI$"
    dispari db 13,10,"Il risultato e' DISPARI$"

    n1 db ?
    n2 db ?
    n3 db ?
    risultato db ?

.code
main:

    mov ax,@data          ; inizializza segmento dati
    mov ds,ax

; -------- lettura n1 --------

    lea dx,msg1           ; stampa messaggio richiesta n1
    mov ah,09h
    int 21h

    mov ah,01h            ; legge un carattere da tastiera
    int 21h               ; il carattere viene messo in AL

    sub al,48             ; conversione ASCII → numero
    mov n1,al             ; salva n1

; -------- lettura n2 --------

    lea dx,msg2           ; stampa messaggio richiesta n2
    mov ah,09h
    int 21h

    mov ah,01h            ; legge un carattere
    int 21h

    sub al,48             ; conversione ASCII → numero
    mov n2,al             ; salva n2

; -------- lettura n3 --------

    lea dx,msg3           ; stampa messaggio richiesta n3
    mov ah,09h
    int 21h

    mov ah,01h            ; legge un carattere
    int 21h

    sub al,48             ; conversione ASCII → numero
    mov n3,al             ; salva n3

; -------- calcolo (n2 - n3) --------

    mov al,n2             ; AL = n2
    sub al,n3             ; AL = n2 - n3

; -------- moltiplicazione --------

    mov bl,n1             ; BL = n1
    mul bl                ; AX = AL * BL

    mov risultato,al      ; salva il risultato

; -------- verifica pari/dispari --------

    mov al,risultato      ; AL = risultato
    mov bl,2
    div bl                ; divisione per 2
                          ; resto in AH

    cmp ah,0              ; se resto = 0 → numero pari
    je numero_pari

; -------- numero dispari --------

    lea dx,dispari
    mov ah,09h
    int 21h
    jmp fine

numero_pari:

    lea dx,pari
    mov ah,09h
    int 21h

fine:

    mov ah,4ch            ; termina il programma
    int 21h

end main