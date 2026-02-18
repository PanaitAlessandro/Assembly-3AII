.model small
.stack 100h

.data
msg1 db "inserisci base: $"
msg2 db "inserisci altezza: $"
msg3 db "inserisci lato obliquo: $"

h db ?
b db ?
lo db ?
area db ?
perimetro db ?

msgarea db "Area: $"
msgperi db "Perimetro: $"

caporiga db 13,10,'$'

.code
STAMPA macro msg
  lea dx, msg
  mov ah, 09h
  int 21h
endm
LEGGIN macro num
  mov ah, 01h
  int 21h
  sub al, '0'
  mov num, al
endm

STAMPAN macro val
  mov ah, 02h
  int 21h
  add al, '0'
endm

  .startup

  STAMPA msg1
  LEGGIN b
  STAMPA caporiga

  STAMPA msg2
  LEGGIN h
  STAMPA caporiga

  STAMPA msg3
  LEGGIN lo
  STAMPA caporiga

  ; area
  mov al, b
  mul h
  mov area, al

  STAMPA msgarea
  STAMPAN area
  STAMPA caporiga

  ; perimetro

  mov bl, b
  add bl, lo
  add bl, b
  add bl, lo
  mov perimetro, bl

  STAMPA msgperi
  STAMPAN perimetro
  .exit
end
