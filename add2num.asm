.model small
.stack 100h

.data
     num db 8d


.code
.startup
    mov cx, 0000h
    mov cl, num
    ciclo:

        mov ah, 02h
        add cl, 48d
        mov dl, cl
        int 21h
        sub cl, 48d
    loop ciclo
    mov ah, 02h
    mov dl, 48d
    int 21h
.exit
end