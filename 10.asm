.model small
.stack 100h

.data
    vettore db 2,3,4,3,1,5,8
    somma db 0
    msg db "Somma Finale: $"

.code
.startup

    mov si, 0
    mov cx, 7
    mov bl, 0      ; Useremo BL come accumulatore per la somma

CICLO:
    add bl, vettore[si] ; Aggiungi l'elemento corrente a BL
    inc si              ; Vai al prossimo elemento
    loop CICLO          ; Decrementa CX e torna su se non è zero

    ; --- Stampa Messaggio ---
    lea dx, msg
    mov ah, 09h
    int 21h

    ; --- Trucco per stampare 26 (due cifre) ---
    mov al, bl     ; AL = 26
    mov ah, 0      ; Pulisci AH per la divisione
    mov bh, 10
    div bh         ; AL = 2 (decine), AH = 6 (unità)

    mov bl, ah     ; Salva il resto (6) in BL per non perderlo

    ; Stampa le Decine (2)
    mov dl, al
    add dl, '0'
    mov ah, 02h
    int 21h

    ; Stampa le Unità (6)
    mov dl, bl
    add dl, '0'
    mov ah, 02h
    int 21h

.exit
end
