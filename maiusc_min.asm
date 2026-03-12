; Inserito un carattere da tastiera verificare se è una lettera
; maiuscola o minuscola

.model small
.stack 200h

.data
    car db 0
    msg_i db "Inserisci un carattere: ",13,10,"$"
    msg_ma db "Il carattere e' una lettera MAIUSCOLA",13,10,"$"
    msg_mi db "Il carattere e' una lettera minuscola",13,10,"$"
    msg_n db "Il carattere non e' una lettera",13,10,"$"
    a_capo db 13,10,"$"

.code
main:

    mov ax,@data           ; inizializza il segmento dati
    mov ds,ax

; -----------------------------
; richiesta del carattere
; -----------------------------

    mov dx,offset msg_i    ; stampa il messaggio di input
    mov ah,09h
    int 21h

    mov ah,01h             ; legge un carattere da tastiera
    int 21h                ; il carattere letto viene salvato in AL

    mov car,al             ; memorizza il carattere nella variabile car

    mov dx,offset a_capo   ; stampa a capo
    mov ah,09h
    int 21h

; -----------------------------
; verifica se è maiuscola
; -----------------------------

    mov al,car             ; carica il carattere in AL

    cmp al,'A'             ; confronto con 'A' 65
    jl non_lettera         ; se AL < 'A' non è una lettera

    cmp al,'Z'             ; confronto con 'Z' 90
    jle maiuscola          ; se AL <= 'Z' è maiuscola

; -----------------------------
; verifica se è minuscola
; -----------------------------

    cmp al,'a'             ; confronto con 'a' 97
    jl non_lettera         ; se AL < 'a' non è lettera

    cmp al,'z'             ; confronto con 'z' 122
    jle minuscola          ; se AL <= 'z' è minuscola

; -----------------------------
; se non rientra nei casi sopra
; -----------------------------

non_lettera:

    mov dx,offset msg_n    ; stampa messaggio "non è una lettera"
    mov ah,09h
    int 21h
    jmp fine

; -----------------------------
; caso lettera maiuscola
; -----------------------------

maiuscola:

    mov dx,offset msg_ma    ; stampa messaggio maiuscola
    mov ah,09h
    int 21h
    jmp fine

; -----------------------------
; caso lettera minuscola
; -----------------------------

minuscola:

    mov dx,offset msg_mi    ; stampa messaggio minuscola
    mov ah,09h
    int 21h

; -----------------------------

fine:
    mov ah,4ch             ; termina il programma
    int 21h

end main