.model small
.stack 100h
.data
        carattere db 'O'
        righe db 15
        colonne db 15

.code               
        .startup
        mov cl, righe

        riga:
        mov ch, colonne

        colonna:
        mov dl, carattere
        mov ah, 02h
        int 21h

        dec ch
        jnz colonna

       mov dl, 13               ;cr
       mov ah, 02h
       int 21h

        mov dl, 10           ; lf
        mov ah, 02h
        int 21h

        dec cl
        jnz riga ; prox riga

   


        .exit

end
