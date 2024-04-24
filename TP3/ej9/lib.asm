extern main
global _start
global exit
global fopen

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

;exit(int)
exit:
mov ebx, [esp+4]
mov eax, 1
int 80h

;fopen(char* filepath, int flags, int mode)
fopen:
push ebp
mov ebp, esp
;cargo los argumentos a los registros como lo demanda la syscall
mov edx, [ebp + 4]
mov ecx, [ebp + 8]
mov ebx, [ebp + 12]
mov eax, 5 ;id de sys_open
int 80h

mov esp, ebp
pop ebp
ret