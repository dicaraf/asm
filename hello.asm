.model small              ; Usa il modello di memoria "small"
                          ; (1 segmento per i dati e 1 segmento per il codice, max 64KB ciascuno)

.stack 200h               ; Riserva 200h byte per lo stack (200h = 512 byte)

.data                     ; Inizio del segmento dati

    msg db 'Hello, World!$' ; Definisce una variabile chiamata "msg"
                            ; db = define byte
                            ; La stringa termina con '$' perché la funzione DOS 09h
                            ; usa '$' come terminatore di stringa

.code                     ; Inizio del segmento codice

main:                     ; Etichetta del punto di ingresso del programma

    mov ax,@data          ; Carica in AX l'indirizzo del segmento dati
                          ; @data è un simbolo che rappresenta il segmento .data

    mov ds,ax             ; Copia il valore di AX nel registro DS
                          ; DS deve contenere l'indirizzo del segmento dati
                          ; altrimenti non possiamo accedere correttamente alle variabili

    mov dx,offset msg     ; Carica in DX l'offset (indirizzo) della variabile msg
                          ; DX ora punta all'inizio della stringa

    mov ah, 09h           ; AH = 09h → codice funzione DOS
                          ; 09h = stampa stringa terminata da '$'

    int 21h               ; Interruzione software 21h
                          ; Chiama i servizi DOS
                          ; In questo caso stampa la stringa puntata da DS:DX

    mov ah,4ch            ; AH = 4Ch → funzione DOS "termina programma"

    int 21h               ; Termina il programma e ritorna al sistema operativo

end main                  ; Indica al linker che l'esecuzione parte da "main"
