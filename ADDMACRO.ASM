.model small
.stack 100h

.data

num1 db ?
num2 db ?
caporiga db 13,10,'$'

.code
LEGGINUM macro num
        mov dl, 01h
        int 21h
        mov num, al

endm

STAMPA macro ris
        mov dl, ris
        mov ah, 02h
        int 21h

endm


.startup
        LEGGINUM num1
        sub num1, '0'

        LEGGINUM num2
        sub num2, '0'

        mov al, num1
        add al, num2
        add al, '0'

        STAMPA al

        .exit


end

