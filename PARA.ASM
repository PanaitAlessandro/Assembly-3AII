.model small
.stack 100h
.data

h db ?
b db ?
lo db ?

msg db "inserisci altezza$"
msg1 db "inserisci base$"
msg2 db "inserisci lato obliquo$"
msg3 db "perimetro:$"
msg4 db "area:$"

caporiga db 13,10, "$"

.code

SCRIVI macro str
        lea dx, str
        mov ah, 09h
        int 21h

endm

SCRIVIC macro car
        mov ah, 02h
        add car, 30h
        mov dl, car
        int 21h
endm

LEGGIC macro car
        mov ah, 01h
        int 21h
        sub al, 30h
        mov car, al
       

endm
        .startup
        SCRIVI msg
        LEGGIC h
        SCRIVI caporiga
        SCRIVI msg1
        LEGGIC b
        SCRIVI caporiga
        SCRIVI msg2
        LEGGIC lo
        SCRIVI caporiga

        mov al, 00
        mov al, lo
        add al, b
        
        add al, lo
        add al, b
        

        mov ah, 02h
        mov dl, al
        int 21h

        SCRIVI msg3
        SCRIVIC al
        
        SCRIVI caporiga

        SCRIVI msg4
        mov al, 00
        mov al, b
        mul h
        SCRIVIC al

        SCRIVI caporiga
        .exit
end
