.model small
.stack 100h

.data
msg1 db "inserisci il primo numero: $"
msg2 db "inserisci il secondo numero: $"
num1 db ?
num2 db ?
primo db "il primo è maggiore $"
secondo db "il secondo è maggiore $"
caporiga db 13,10,'$"

.code

STAMPA macro str
  lea dx, msg
  mov ah, 09h 
  int 21h
endm

LEGGI macro num
  mov ah, 01h
  sub al, '0'
  int 21h
  mov al, num
endm

  .startup

  STAMPA msg1
  LEGGI num1
  STAMPA caporiga

  STAMPA msg2
  LEGGI num2
  STAMPA caporiga

  mov bl, num1
  cmp bl, num2
  jg SECONDO
  STAMPA primo

SECONDO:
  STAMPA secondo
  .exit

end
