 .model small
 .stack 100h
 .data
 num1 db 2
 num2 db 4
 result db 0
 msg db 'Risultato: $'
 .code
        .startup
        mov al, 0
        mov cl, num2
        mov bl, num1

        mul_loop:
        cmp cl, 0
        je done_mul
        add al, bl
        dec cl
        jmp mul_loop

        done_mul:
        mov result, al

        lea dx, msg
        mov ah, 09h
        int 21h

        mov al, result
        add al, '0'
        mov dl, al
        mov ah, 02h
        int 21h

        .exit

end
