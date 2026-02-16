.model small
.stack 100h

.data
msg db "Inserisci un numero (0-9): $"
pariMsg db "Il numero e' PARI$"
dispariMsg db "Il numero e' DISPARI$"
num db ?
caporiga db 13,10, '$'

.code
.startup

    ; stampa messaggio
    lea dx, msg
    mov ah, 09h
    int 21h

    ; legge carattere da tastiera
    mov ah, 01h
    int 21h           ; AL = carattere ASCII digitato

    sub al, '0'       ; converte da ASCII a numero
    mov num, al       ; salva nella variabile

    lea dx, caporiga
    mov ah, 09h
    int 21h

    ; controlla se pari o dispari
    mov al, num
    and al, 1
    cmp al, 0
    je pari
    jne dispari

pari:
    lea dx, pariMsg
    mov ah, 09h
    int 21h
    jmp fine

dispari:
    lea dx, dispariMsg
    mov ah, 09h
    int 21h

fine:
.exit
end
