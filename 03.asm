.model small
.stack 100h

.data
msg db "Benvenuto in questo esercizio SUEZ $"
msgs db "suez$"


.code
  .startup

  lea si, msgs

  ; trovare il $

  trova_fine:
  cmp al, [si]
  cmp al, '$'
  je prepara_while
  inc si
  jmp trova_fine

  prepara_while:
  dec si
  lea bx, stringa


  while_cazzuto:

  cmp si, bx
    jb fine ; jump below

    mov dl, [si]
    mov ah, 02h
    int 21h

    dec si
    jmp while_cazzuto

fine:
    mov ah, 4Ch
    int 21h
  .exit
end
