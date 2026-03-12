; dato il carattere * stampare la forma di L
; *
; *
; *
; *
; *****

.model small              ; modello di memoria SMALL: un segmento dati e uno di codice
.stack 200h               ; riserva 200h byte (512 byte) per lo stack

.data                     ; inizio segmento dati
a_capo db "",13,10,"$"    ; stringa per andare a capo (CR=13, LF=10) terminata da $ per la funzione 09h

.code                     ; inizio segmento codice
main:                     ; etichetta di ingresso del programma

    mov ax,@data          ; carica in AX l'indirizzo del segmento dati
    mov ds,ax             ; inizializza DS con l'indirizzo del segmento dati

    ; -------- stampa parte verticale della L --------
    mov cx,04             ; CX = 4 → numero di righe verticali da stampare

verticale:                ; inizio ciclo per la stampa verticale
    mov dl,42d            ; DL = 42 → codice ASCII del carattere '*'
    mov ah,02h            ; funzione DOS 02h → stampa il carattere contenuto in DL
    int 21h               ; chiamata al sistema operativo DOS per stampare '*'

    lea dx,a_capo         ; carica in DX l'indirizzo della stringa a_capo (per andare a capo)
    mov ah,09h            ; funzione DOS 09h → stampa stringa terminata da $
    int 21h               ; stampa il ritorno a capo

    loop verticale        ; decrementa CX e ripete il ciclo se CX ≠ 0

    ; -------- stampa parte orizzontale della L --------
    mov cx,06             ; CX = 6 → numero di '*' da stampare in orizzontale

orizzontale:              ; inizio ciclo per la stampa orizzontale
    mov dl,42d            ; DL = '*' (ASCII 42)
    mov ah,02h            ; funzione DOS 02h → stampa il carattere
    int 21h               ; stampa '*'

    loop orizzontale      ; decrementa CX e ripete finché CX ≠ 0

    mov ah,4ch            ; funzione DOS 4Ch → terminazione del programma
    int 21h               ; ritorna al sistema operativo

end main                  ; indica all'assembler che il programma inizia da main