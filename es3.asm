;acquisizione dato da tastiera

.model small
.stack 200h
.data
    msg db 'Inserisci un carattere:$'
    car db 0

.code

main:
    mov ax, @data
    mov ds, ax

    mov dx, offset msg
    mov ah, 09h ;codice per stampare stringhe
    int 21h

    mov ah, 01h ;il numero letto da tastiera va in al, 08h per un carattere
    int 21h

    mov dl, al

    mov ah, 02h ; stampa numero
    int 21h



    mov ah, 4ch
    int 21h
end main