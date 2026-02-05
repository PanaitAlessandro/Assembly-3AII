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
        LEGGINUM num2

        mov al, num1
        add al, num2
        int 21h

        STAMPA al



        .exit


end
