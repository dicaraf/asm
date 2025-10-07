.model small
.stack 200h
.data
    num db ?

.code

main:
    mov ax, @data
    mov ds, ax

    mov num, 03h
    mov dl, num
    add dl, 30h

    mov ah, 02h
    int 21h

    mov ah, 4ch
    int 21h
end main