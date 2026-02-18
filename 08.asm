.model small
.stack 100h

.data
    L1 db ?
    L2 db ?
    L3 db ?
    
    msg1 db "Inserisci L1: $"
    msg2 db 13,10,"Inserisci L2: $"
    msg3 db 13,10,"Inserisci L3: $"
    
    msgSi db 13,10,"Sono i lati di un triangolo$"
    msgNo db 13,10,"Non sono i lati di un triangolo$"
    caporiga db 13,10,'$'

.code

; --- Macro per stampare stringhe ---
STAMPA macro msg
    lea dx, msg
    mov ah, 09h
    int 21h
endm

; --- Macro per leggere un numero (0-9) ---
LEGGIN macro num
    mov ah, 01h
    int 21h
    sub al, '0'
    mov num, al
endm

.startup

    ; --- Input dei 3 lati ---
    STAMPA msg1
    LEGGIN L1
    
    STAMPA msg2
    LEGGIN L2
    
    STAMPA msg3
    LEGGIN L3

    ; --- Verifica Condizione 1: L1 < L2 + L3 ---
    mov al, L2
    add al, L3      ; AL = L2 + L3
    cmp L1, al      ; Confronta L1 con la somma
    jge non_tri     ; Se L1 >= somma, salta a "non è un triangolo"

    ; --- Verifica Condizione 2: L2 < L1 + L3 ---
    mov al, L1
    add al, L3      ; AL = L1 + L3
    cmp L2, al      ; Confronta L2 con la somma
    jge non_tri     ; Se L2 >= somma, salta

    ; --- Verifica Condizione 3: L3 < L1 + L2 ---
    mov al, L1
    add al, L2      ; AL = L1 + L2
    cmp L3, al      ; Confronta L3 con la somma
    jge non_tri     ; Se L3 >= somma, salta

    ; Se arriva qui, tutte le condizioni sono vere
    STAMPA msgSi
    jmp fine

non_tri:
    STAMPA msgNo

fine:
    STAMPA caporiga
    .exit
end
