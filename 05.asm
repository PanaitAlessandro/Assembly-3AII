.model small
.stack 100h

.data
msg1 db "Inserisci primo numero: $"
msg2 db "Inserisci secondo numero: $"
num1 db ?
num2 db ?
caporiga db 13,10,'$'
msg db "La moltiplicazione è: "
.code

STAMPA macro str
  lea dx, str
  mov ah, 09h
  int 21h

endm

LEGGI macro num
  mov ah, 01h
  int 21h
  sub al, '0'     ; ASCII → numero
  mov num, al

endm
  .startup

  STAMPA msg1
  STAMPA caporiga
  LEGGI num1

  STAMPA msg2
  STAMPA caporiga
  LEGGI num2

  mov al, num1
  mul num2

  STAMPA msg
    add al, '0'
    mov dl, al
    mov ah, 02h
    int 21h
  .exit

end
