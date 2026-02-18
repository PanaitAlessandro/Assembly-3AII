.model small
.stack 100h

.data
msg1 db "Base (0-4): $"          ; Usiamo numeri piccoli per non superare 9
msg2 db "Altezza (0-2): $" 
msg3 db "Lato obliquo (0-2): $"

b db ?
h db ?
lo db ?
area db ?
perimetro db ?

msgarea db 13,10,"Area: $"
msgperi db 13,10,"Perimetro: $"
caporiga db 13,10,'$'

.code

; --- Macro per stampare stringhe ---
STAMPA macro msg
    lea dx, msg
    mov ah, 09h
    int 21h
endm

; --- Macro per leggere un numero (converte ASCII -> NUM) ---
LEGGIN macro num
    mov ah, 01h
    int 21h
    sub al, '0'   ; Converte il carattere (es. '1' cioè 49) in numero (1)
    mov num, al
endm

; --- Macro per stampare un numero (converte NUM -> ASCII) ---
STAMPAN macro val
    mov dl, val   ; IL SEGRETO: l'interruzione 21h/02h vuole il dato in DL
    add dl, '0'   ; Converte il numero (1) in carattere ('1' cioè 49)
    mov ah, 02h
    int 21h
endm

.startup

; --- Input ---
STAMPA msg1
LEGGIN b

STAMPA msg2
LEGGIN h

STAMPA msg3
LEGGIN lo

; --- Calcolo Area (b * h) ---
mov al, b
mul h            ; AL * h -> Risultato in AX
mov area, al     ; Salviamo solo la parte bassa (AL)

STAMPA msgarea
STAMPAN area     ; Chiamiamo la macro corretta

; --- Calcolo Perimetro (2*b + 2*lo) ---   
mov al, b
add al, b        ; 2 * base
add al, lo
add al, lo        ; + 2 * lato obliquo
mov perimetro, al

STAMPA msgperi
STAMPAN perimetro

STAMPA caporiga

.exit
end
