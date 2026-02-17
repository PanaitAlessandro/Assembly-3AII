.model small
.stack 100h

.data
msg db "scegli un'operazione (1-4)... $"
msgsum db "1) SOMMA $"
msgsub db "2) SOTTRAZIONE $"
msgprod db "3) PRODOTTO $"
msgdiv db "4) DIVISIONE $"
msgnum db "Ora dai.. inserisci il numero: $"
msgerr db "Il numero non e' nel range 1-4 $"
caporiga db 13,10,"$"

.code

STAMPAS macro str
    lea dx, str
    mov ah, 09h
    int 21h
endm

.startup

STAMPAS msg
STAMPAS caporiga
STAMPAS msgsum
STAMPAS caporiga
STAMPAS msgsub
STAMPAS caporiga
STAMPAS msgprod
STAMPAS caporiga
STAMPAS msgdiv
STAMPAS caporiga
STAMPAS msgnum

; ---- lettura input ----
mov ah, 01h
int 21h        ; AL = ASCII
sub al, '0'    ; ASCII -> numero

; ---- controllo range ----
cmp al, 1
jl ERRORE
cmp al, 4
jg ERRORE

cmp al, 1
je SOMMA
cmp al, 2
je SUB
cmp al, 3
je PROD
cmp al, 4
je DIV

SOMMA:
STAMPAS caporiga
STAMPAS msgsum
jmp FINE

SUB:
STAMPAS caporiga
STAMPAS msgsub
jmp FINE

PROD:
STAMPAS caporiga
STAMPAS msgprod
jmp FINE

DIV:
STAMPAS caporiga
STAMPAS msgdiv
jmp FINE

ERRORE:
STAMPAS caporiga
STAMPAS msgerr

FINE:
.exit
end
