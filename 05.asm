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
    mov ah, 01h
    int 21h
    sub al, '0'        ; ASCII -> numero
    mov num, al
endm

.startup

    STAMPA msg1
    LEGGI num1
    STAMPA caporiga

    STAMPA msg2
    LEGGI num2
    STAMPA caporiga

    ; -------------------------
    ; moltiplicazione
    ; -------------------------
    mov al, num1
    mul num2           ; AX = risultato

    ; preparazione divisione per 10
    mov ah, 0          ; <<< invece di XOR
    mov bl, 10
    div bl             ; AL=decine AH=unità

    STAMPA msg

    ; stampa decine solo se != 0
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
