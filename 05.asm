.model small
.stack 100h

.data
msg1 db "Inserisci primo numero: $"
msg2 db "Inserisci secondo numero: $"
num1 db ?
num2 db ?
caporiga db 13,10,'$'
msg db "La moltiplicazione e': $"

.code

STAMPA macro str
    lea dx, str
    mov ah, 09h
    int 21h
endm

LEGGI macro num
LEGGI_DI_NUOVO:
    mov ah, 01h
    int 21h
    cmp al, 13        ; ignora ENTER
    je LEGGI_DI_NUOVO
    sub al, '0'
    mov num, al
endm

.startup

    STAMPA msg1
    LEGGI num1
    STAMPA caporiga

    STAMPA msg2
    LEGGI num2
    STAMPA caporiga

    mov al, num1
    mul num2          ; AX = risultato

    mov bl, 10
    div bl            ; AL=decine AH=unità

    STAMPA msg

    cmp al, 0
    je SOLO_UNITA

    add al, '0'
    mov dl, al
    mov ah, 02h
    int 21h

SOLO_UNITA:
    mov al, ah
    add al, '0'
    mov dl, al
    mov ah, 02h
    int 21h

.exit
end
