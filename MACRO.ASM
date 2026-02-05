.model small
.stack 100h

.data

  msg db 'caio$'
  acapo db 13,10,'$'

.code

STAMPA macro str
        lea dx, msg
        mov ah, 09h
        int 21h
endm

        .startup

        STAMPA msg
        STAMPA acapo
        STAMPA msg


        .exit


end
