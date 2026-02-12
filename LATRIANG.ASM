.model small
.stack 100h

.data

l1 db ?
l2 db ?
l3 db ?

msg1 db "Inserisci l1: $"
msg2 db "Inserisci l2: $"
msg3 db "Inserisci l3: $"
msgsi db "Sono i lati di un triangolo$"
msgno db "Non sono i lati di un triangolo$"


.code
LEGGI macro str
        lea dx, str
        mov ah, 09h
        int 21h


endm

LEGGIN macro n
        mov ah, 01h
        int 21h
        sub al, 30h
        mov n, al

endm


 



        .startup



        .exit
end
