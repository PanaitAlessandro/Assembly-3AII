.model small
.stack 100h

.data
msg1 db "Inserisci base: $"
msg2 db "Inserisci altezza: $"
msg3 db "Inserisci lato obliquo: $"

b db ?       ; base
h db ?       ; altezza
lo db ?      ; lato obliquo
area db ?
perimetro db ?

msgarea db "Area: $"
msgperi db "Perimetro: $"
caporiga db 13,10,'$'

.code

; --- macro per stampare stringhe ---
STAMPA macro msg
  lea dx, msg
  mov ah, 09h
  int 21h
endm

; --- macro per leggere un numero singolo (0-9) ---
LEGGIN macro num
  mov ah, 01h
  int 21h
  sub al, '0'
  mov num, al
endm

; --- macro per stampare un numero singolo (0-9) ---
STAMPAN macro val
  mov ah, 02h
  add al, '0'
  int 21h
endm

.startup

; --- input base ---
STAMPA msg1
LEGGIN b
STAMPA caporiga

; --- input altezza ---
STAMPA msg2
LEGGIN h
STAMPA caporiga

; --- input lato obliquo ---
STAMPA msg3
LEGGIN lo
STAMPA caporiga

; --- calcolo area (base * altezza) ---
mov al, b
mul h          ; AL * h -> AX
mov area, al

STAMPA msgarea
mov al, area
STAMPAN al
STAMPA caporiga

; --- calcolo perimetro (2*base + 2*lato obliquo) ---
mov al, b
add al, b      ; AL = 2*base
add al, lo
add al, lo     ; AL = 2*base + 2*lo
mov perimetro, al

STAMPA msgperi
mov al, perimetro
STAMPAN al
STAMPA caporiga

.exit
end
