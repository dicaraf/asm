; programma che verifica se un numero è multiplo di 4

.model small
.stack 200h

.data
    n1 db 8                          ; numero definito nel programma
    msg1 db "Il numero e' multiplo di 4$"
    msg2 db "Il numero NON e' multiplo di 4$"

.code
main:

    mov ax,@data                     ; carica l'indirizzo del segmento dati
    mov ds,ax                        ; inizializza il registro DS

; -------- verifica multiplo di 4 --------

    mov al,n1                        ; carica il numero n1 nel registro AL
    mov bl,4                         ; carica il divisore 4 nel registro BL

    div bl                           ; divide AX per BL
                                     ; quoziente -> AL
                                     ; resto -> AH

    cmp ah,0                         ; confronta il resto con 0
    je multiplo                      ; se il resto è 0 allora è multiplo di 4

; -------- numero NON multiplo --------

    lea dx,msg2                      ; carica il messaggio "non multiplo"
    mov ah,09h                       ; funzione DOS per stampare stringa
    int 21h                          ; stampa il messaggio
    jmp fine                         ; salta alla fine del programma

; -------- numero multiplo --------

multiplo:

    lea dx,msg1                      ; carica il messaggio "multiplo"
    mov ah,09h                       ; funzione DOS per stampare stringa
    int 21h                          ; stampa il messaggio

fine:

    mov ah,4ch                       ; funzione DOS 4Ch -> termina programma
    int 21h                          ; ritorna al sistema operativo

end main