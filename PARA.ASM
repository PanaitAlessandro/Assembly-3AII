.model small
.stack 100h

.data
h   db ?
b   db ?
lo  db ?

msg  db "inserisci altezza: $"
msg1 db "inserisci base: $"
msg2 db "inserisci lato obliquo: $"
msg3 db 13,10,"perimetro: $"
msg4 db 13,10,"area: $"
caporiga db 13,10,"$"

.code

; stampa stringa
SCRIVI macro str
    lea dx, str
    mov ah, 09h
    int 21h
endm

; legge numero a 2 cifre
LEGGI2 macro doppia
    ; prima cifra
    mov ah, 01h
    int 21h
    sub al, 30h
    mov bl, al

    ; seconda cifra
    mov ah, 01h
    int 21h
    sub al, 30h
    mov bh, al

    ; prima * 10
    mov al, bl
    mov ah, 0
    mov cl, 10
    mul cl

    ; + seconda cifra
    add al, bh

    mov doppia, al
endm
; stampa numero a 2 cifre
SCRIVI2 macro val
    mov al, val
    mov ah, 0
    mov bl, 10
    div bl            ; AL = decine, AH = unità

    ; stampa decine
    add al, 30h
    mov dl, al
    mov ah, 02h
    int 21h

    ; stampa unità
    mov al, ah
    add al, 30h
    mov dl, al
    mov ah, 02h
    int 21h
endm

.startup

    ; lettura altezza
    SCRIVI msg
    LEGGI2 h
    SCRIVI caporiga

    ; lettura base
    SCRIVI msg1
    LEGGI2 b
    SCRIVI caporiga

    ; lettura lato obliquo
    SCRIVI msg2
    LEGGI2 lo
    SCRIVI caporiga

    mov al, b
    add al, b
    add al, lo
    add al, lo

    SCRIVI msg3
    SCRIVI2 al

    mov al, b
    mov ah, 0
    mul h        ; AX = b * h

    mov bl, 2
    div bl       ; AL = risultato

    SCRIVI msg4
    SCRIVI2 al

    SCRIVI caporiga

.exit
end
