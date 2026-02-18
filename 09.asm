.model small
.stack 100h

.data
    ; I due array iniziali
    arr1 db 1, 3, 4, 2, 1, 3
    arr2 db 3, 2, 1, 4, 5, 3
    ; L'array dove salveremo i risultati
    ris  db 6 dup(?) 
    
    min  db 255    ; Iniziamo col valore più alto possibile
    max  db 0      ; Iniziamo col valore più basso possibile

    msgRis  db "Risultato: $"
    msgMax  db 13,10,"Il valore massimo e': $"
    msgMin  db 13,10,"Il valore minimo e': $"
    spazio  db ", $"

.code

; --- Macro per stampare stringhe ---
STAMPA macro msg
    lea dx, msg
    mov ah, 09h
    int 21h
endm

; --- Macro per stampare numeri (0-99) ---
STAMPAN macro val
    mov al, val
    mov ah, 0
    mov bl, 10
    div bl
    mov bh, ah
    mov dl, al
    add dl, '0'
    mov ah, 02h
    int 21h
    mov dl, bh
    add dl, '0'
    mov ah, 02h
    int 21h
endm

.startup

    mov cx, 6          ; Numero di elementi da elaborare
    mov si, 0          ; Indice di partenza (offset 0)

ciclo_calcolo:
    ; 1. Moltiplicazione
    mov al, arr1[si]
    mul arr2[si]       ; AL = arr1 * arr2
    mov ris[si], al    ; Salva nel vettore risultato

    ; 2. Controllo Massimo
    cmp al, max
    jbe controllo_min  ; Se AL <= max, vai al controllo min
    mov max, al        ; Altrimenti, aggiorna il nuovo massimo

controllo_min:
    ; 3. Controllo Minimo
    cmp al, min
    jae prossimo       ; Se AL >= min, vai avanti
    mov min, al        ; Altrimenti, aggiorna il nuovo minimo

prossimo:
    inc si             ; Passa al prossimo elemento
    loop ciclo_calcolo ; Torna su finché CX non è 0

    ; --- Stampa Risultati ---
    STAMPA msgRis
    mov si, 0
    mov cx, 6

stampa_array:
    STAMPAN ris[si]
    cmp cx, 1          ; Se è l'ultimo numero, non stampare la virgola
    je fine_stampa
    STAMPA spazio
fine_stampa:
    inc si
    loop stampa_array

    STAMPA msgMax
    STAMPAN max

    STAMPA msgMin
    STAMPAN min

    .exit
end
