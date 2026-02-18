.model small
.stack 100h

.data

msg db "Stringa iniziale: l'allegria ogni male caccia via$"
stringa db "l'allegria ogni male caccia via"
num db 0
len equ $ - stringa

caporiga db 13,10,"$"

.code
.startup

    lea dx, msg
    mov ah, 09h
    int 21h

    lea dx, caporiga
    mov ah, 09h
    int 21h

    lea si, stringa
    mov cx, 0

WHILE:
    cmp cx, len
    je FINE

    mov al, [si]
    cmp al, 'a'
    jne NON_TROVATO

    inc num          ; solo se è 'a'

NON_TROVATO:
    inc si
    inc cx
    jmp WHILE

FINE:
    mov al, num
    add al, '0'      ; converti in ASCII
    mov dl, al       ; DL = carattere da stampare
    mov ah, 02h      ; funzione DOS: stampa DL
    int 21h

.exit
end
