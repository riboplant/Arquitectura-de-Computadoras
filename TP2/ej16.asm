section .text
global _start

extern print
extern exit
extern numtostr
extern carr_ret
extern caps

_start:
mov eax, 3
mov ebx, 0
mov ecx, placeholder
mov edx, longitud

int 80h
; me deja el string recibido en la terminal en mi placeholder
; si el largo se excede, devuelve ese excedente a la terminal
mov ebx, placeholder
call caps
call print

call exit

section .data
no_arg_str db "no arguments provided", 10,0
longitud equ 64
section .bss
placeholder resb 64