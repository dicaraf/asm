.model small              ; Modello di memoria small (1 segmento dati + 1 segmento codice)

.stack 200h               ; Riserva 200h byte per lo stack (512 byte)

.data                     ; Inizio segmento dati

    num db 0              ; Definisce una variabile "num" di 1 byte inizializzata a 0

.code                     ; Inizio segmento codice

main:                     ; Punto di ingresso del programma

    mov ax,@data          ; Carica in AX l'indirizzo del segmento dati

    mov ds,ax             ; Inizializza il registro DS con il segmento dati
                          ; Necessario per poter accedere correttamente alle variabili

    mov num,03h           ; Assegna alla variabile "num" il valore 03h (cioè 3 in esadecimale)

    mov dl,num            ; Copia il contenuto di "num" nel registro DL
                          ; DL = 03h

    add dl,48d            ; Somma 48 decimale (30h) a DL
                          ; 48 è il codice ASCII del carattere '0'
                          ; Serve per convertire il numero 3 nel carattere ASCII '3'
                          ; DL passa da 03h a 33h

    mov ah,02h            ; AH = 02h → funzione DOS "stampa carattere"
                          ; Questa funzione stampa il carattere contenuto in DL

    int 21h               ; Chiama l'interruzione DOS
                          ; Stampa il carattere contenuto in DL

    mov ah,4ch            ; AH = 4Ch → funzione DOS "termina programma"

    int 21h               ; Termina il programma e ritorna al sistema operativo

end main                  ; Indica al linker che il programma inizia da main