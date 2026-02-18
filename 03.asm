.model small
.stack 100h

.data
msg db "Benvenuto in questo esercizio SUEZ $"
caporiga db 13,10,'$'
msgs db "suez$"

.code
.startup

    lea dx, msg
    mov ah, 09h
    int 21h

    lea dx, caporiga
    mov ah, 09h
    int 21h

    lea si, msgs

; -------------------------
; trovare il $
; -------------------------
trova_fine:
    mov al, [si]
    cmp al, '$'
    je prepara_while
    inc si
    jmp trova_fine

prepara_while:
    dec si
    lea bx, msgs

; -------------------------
; while (si >= bx)
; -------------------------
while_cazzuto:

    cmp si, bx
    jb fine

    mov dl, [si]
    mov ah, 02h
    int 21h

    dec si
    jmp while_cazzuto

fine:
.exit
end
