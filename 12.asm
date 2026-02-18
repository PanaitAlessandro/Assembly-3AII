.model small
.stack 100h
.data
    dati db 2, 8, 4, 9, 3, 7, 1
    filtrati db 7 dup(0)
.code
.startup
    mov cx, 7
    mov si, 0     ; Indice per leggere
    mov di, 0     ; Indice per scrivere solo i numeri validi

FILTRA:
    mov al, dati[si]
    cmp al, 5
    jbe PROSSIMO   ; Se è <= 5, salta la copia

    mov filtrati[di], al
    inc di         ; Incrementa DI solo se abbiamo copiato qualcosa
PROSSIMO:
    inc si
    loop FILTRA

    ; Stampa il risultato
    mov cx, 7
    mov si, 0
STAMPA_FILTRO:
    mov dl, filtrati[si]
    add dl, '0'
    mov ah, 02h
    int 21h
    inc si
    loop STAMPA_FILTRO

.exit
end
