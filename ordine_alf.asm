; dati due caratteri stamparli in ordine alfabetico

.model small
.stack 200h

.data
    c1 db 0                     ; primo carattere inserito
    c2 db 0                     ; secondo carattere inserito
    msg_i db "Inserisci un carattere: ",13,10,"$"
    msg_o db "I caratteri in ordine alfabetico sono: ",13,10,"$"
    a_capo db 13,10,"$"

.code
main:

    mov ax,@data                ; inizializza il segmento dati
    mov ds,ax

; -----------------------------
; acquisizione primo carattere
; -----------------------------

    mov dx,offset msg_i         ; stampa messaggio input
    mov ah,09h
    int 21h

    mov ah,01h                  ; legge un carattere da tastiera
    int 21h                     ; il carattere letto va in AL
    mov c1,al                   ; salviamo il carattere nella variabile c1

    mov dx,offset a_capo        ; stampa a capo
    mov ah,09h
    int 21h

; -----------------------------
; acquisizione secondo carattere
; -----------------------------

    mov dx,offset msg_i
    mov ah,09h
    int 21h

    mov ah,01h                  ; legge il secondo carattere
    int 21h
    mov c2,al                   ; salviamo il carattere nella variabile c2

    mov dx,offset a_capo
    mov ah,09h
    int 21h

; -----------------------------
; stampa messaggio output
; -----------------------------

    mov dx,offset msg_o
    mov ah,09h
    int 21h

; -----------------------------
; confronto tra i due caratteri
; -----------------------------

    mov al,c1                   ; carichiamo il primo carattere
    cmp al,c2                   ; confronto tra c1 e c2
    jg scambia                  ; se c1 > c2 saltiamo per invertirli

; -----------------------------
; stampa c1 poi c2 (già ordinati)
; -----------------------------

    mov dl,c1
    mov ah,02h                  ; stampa carattere
    int 21h

    mov dl,c2
    mov ah,02h
    int 21h

    jmp fine

; -----------------------------
; stampa c2 poi c1 (ordine invertito)
; -----------------------------

scambia:

    mov dl,c2
    mov ah,02h
    int 21h

    mov dl,c1
    mov ah,02h
    int 21h

; -----------------------------

fine:
    mov ah,4ch                  ; termina il programma
    int 21h

end main