; Acquisizione di un dato da tastiera

.model small              ; Modello di memoria small
                          ; (1 segmento dati + 1 segmento codice)

.stack 200h               ; Riserva 200h byte per lo stack (512 byte)

.data                     ; Inizio segmento dati

    msg db 'Inserisci un carattere:$'
                          ; Stringa da stampare
                          ; Terminata con '$' perché la funzione 09h
                          ; usa '$' come terminatore

    car db 0              ; Variabile di 1 byte per contenere un carattere
                          ; (in questo codice però NON viene usata)

.code                     ; Inizio segmento codice

main:

    mov ax,@data          ; Carica in AX l'indirizzo del segmento dati
    mov ds,ax             ; Inizializza DS per poter accedere ai dati

    ; -------- STAMPA DEL MESSAGGIO --------
    mov dx, offset msg    ; DX = indirizzo della stringa msg
    mov ah,09h            ; Funzione DOS 09h → stampa stringa
    int 21h               ; Stampa "Inserisci un carattere:"

    ; -------- LETTURA DA TASTIERA --------
    mov ah,08h            ; Funzione DOS 08h → legge un carattere
                          ; NON mostra il carattere digitato (no echo)
                          ; Il carattere letto viene messo in AL
    int 21h               ; AL = carattere inserito

    ; -------- STAMPA DEL CARATTERE LETTO --------
    mov dl,al             ; Copia il carattere letto in DL
                          ; La funzione 02h stampa il carattere in DL

    mov ah,02h            ; Funzione DOS 02h → stampa un singolo carattere
    int 21h               ; Stampa il carattere digitato

    ; -------- TERMINAZIONE PROGRAMMA --------
    mov ah,4ch            ; Funzione DOS 4Ch → termina il programma
    int 21h

end main