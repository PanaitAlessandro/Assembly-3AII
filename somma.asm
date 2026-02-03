.model small
.stack 100h

.data
    num1 db 5           ; Primo numero (0-9)
    num2 db 7           ; Secondo numero (0-9)
    risultato db 0      ; Qui salviamo il risultato
    msg db 'Risultato: $' ; Messaggio da stampare, terminato da $ per DOS

.code
start:

    ; ===============================
    ; 1) Somma dei numeri
    ; ===============================
    mov al, num1        ; AL = num1
    ; AL è il registro "accumulatore basso", usato per operazioni aritmetiche 8 bit
    add al, num2        ; AL = AL + num2
    ; somma AL + num2, risultato rimane in AL
    mov risultato, al   ; Salviamo il risultato in memoria
    ; risultato è una cella in .data, con db (8 bit)

    ; ===============================
    ; 2) Stampiamo il messaggio
    ; ===============================
    lea dx, msg         ; DX = indirizzo del messaggio
    ; DX serve per indicare l’indirizzo della stringa da stampare
    mov ah, 09h         ; AH = 09h → funzione DOS: stampa stringa terminata da '$'
    int 21h             ; Interrupt DOS 21h chiama la funzione specificata in AH
    ; Stampa il contenuto di msg sullo schermo

    ; ===============================
    ; 3) Convertiamo il risultato in ASCII
    ; ===============================
    ; I numeri in memoria sono valori binari (es. 12 = 0Ch), ma per stampare servono caratteri ASCII
    mov al, risultato   ; AL = risultato (valore binario 0-9)
    add al, '0'         ; Trasformiamo in ASCII aggiungendo 30h
    ; Ora AL contiene il carattere ASCII corrispondente al numero

    ; ===============================
    ; 4) Stampiamo il numero
    ; ===============================
    mov dl, al          ; DL = AL, il registro DL serve per stampare un singolo carattere
    mov ah, 02h         ; AH = 02h → funzione DOS: stampa un singolo carattere contenuto in DL
    int 21h             ; Stampa il numero sullo schermo

    ; ===============================
    ; 5) Fine programma
    ; ===============================
    mov ah, 4Ch         ; AH = 4Ch → funzione DOS: termina programma
    int 21h             ; Chiamata interrupt DOS

end start
