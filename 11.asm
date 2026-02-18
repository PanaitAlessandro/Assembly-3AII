.model small
.stack 100h
.data
    vettore db 1, 2, 3, 4, 5
    inverso db 5 dup(?)
.code
.startup
    mov cx, 5
    mov si, 0     ; Indice per l'origine (parte da 0)
    mov di, 4     ; Indice per la destinazione (parte da 4)

COPIA:
    mov al, vettore[si]
    mov inverso[di], al
    inc si        ; Avanti nell'origine
    dec di        ; Indietro nella destinazione
    loop COPIA

    ; Stampa per verifica
    mov cx, 5
    mov si, 0
STAMPA_INV:
    mov dl, inverso[si]
    add dl, '0'
    mov ah, 02h
    int 21h
    inc si
    loop STAMPA_INV

.exit
end
