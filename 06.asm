.model small
.stack 100h

.data
msg1 db "inserisci il primo numero: $"
msg2 db "inserisci il secondo numero: $"
num1 db ?
num2 db ?
primo db "il primo è maggiore $"
secondo db "il secondo è maggiore $"
caporiga db 13,10,'$'

.code
main proc
    ; inizializza segmento dati
    mov ax, @data
    mov ds, ax

STAMPA macro str
    lea dx, str
    mov ah, 09h
    int 21h
endm

LEGGI macro num
    mov ah, 01h
    int 21h
    sub al, '0'
    mov num, al
endm

    STAMPA msg1
    LEGGI num1
    STAMPA caporiga

    STAMPA msg2
    LEGGI num2
    STAMPA caporiga

    cmp num1, num2
    jg PRIM
    STAMPA secondo
    jmp FINE
PRIM:
    STAMPA primo
FINE:
    mov ah, 4Ch
    int 21h
main endp
end main
