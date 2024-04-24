extern main
global _start

section .text

_start:
;armo el stack frame
push ebp
mov ebp, esp
;cargo cantidad de argumentos en ebx
add esp, 4
mov ebx, [esp]
;muevo a esp a la primera posicion del array
;pusheo de derecha a izquierda
add esp, 4
push esp
push ebx
;llamo a main
call main
;reacomodo el stack de los 2 argumentos q le pase
add esp, 2*4
;el codigo de salida sera el devuelto por main en eax
mov ebx, eax
mov eax, 1
;llamo a exit
int 80h