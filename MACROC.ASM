.model small
.stack 100h

.data
lettera db ?
caporiga db 13,10,'$'

.code
STAMPA macro str
     mov dl, str
     mov ah, 02h
     int 21h
     endm

CAPO macro riga
     lea dx, riga
     mov ah, 09h
     int 21h
     endm

LEGGI macro str
     mov ah, 01h
     int 21h
     mov str, al

     endm

        .startup
         LEGGI lettera
         CAPO caporiga
         STAMPA lettera

        .exit

end
