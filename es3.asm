; acquisizione dato da tastiera

.model small
; Modello di memoria "small":
; 1 segmento per i dati e 1 segmento per il codice

.stack 200h
; Riserva 200h byte (512 byte) per lo stack

.data
    msg db 'Inserisci un carattere:$'
    ; Stringa da mostrare all'utente
    ; Il carattere '$' è il terminatore richiesto dalla funzione DOS 09h

    car db 0
    ; Variabile di 1 byte destinata a contenere il carattere letto
    ; (in questo programma però non viene utilizzata)

.code

main:

    mov ax, @data
    ; Carica in AX l'indirizzo del segmento dati

    mov ds, ax
    ; Inizializza il registro DS per poter accedere alle variabili del segmento dati

    ; -------- STAMPA DEL MESSAGGIO --------
    mov dx, offset msg
    ; DX contiene l'indirizzo della stringa da stampare

    mov ah, 09h
    ; Funzione DOS 09h → stampa una stringa terminata da '$'

    int 21h
    ; Chiamata all'interrupt DOS che esegue la stampa

    ; -------- LETTURA DA TASTIERA --------
    mov ah, 01h
    ; Funzione DOS 01h → legge un carattere da tastiera
    ; Il carattere viene:
    ; - memorizzato in AL
    ; - mostrato automaticamente sullo schermo (echo)

    int 21h
    ; AL = carattere inserito dall'utente

    mov dl, al
    ; Copia il carattere letto in DL
    ; La funzione 02h usa DL per stampare il carattere

    ; -------- STAMPA DEL CARATTERE --------
    mov ah, 02h
    ; Funzione DOS 02h → stampa il carattere contenuto in DL

    int 21h
    ; Stampa il carattere inserito

    ; -------- TERMINAZIONE PROGRAMMA --------
    mov ah, 4ch
    ; Funzione DOS 4Ch → termina il programma

    int 21h

end main