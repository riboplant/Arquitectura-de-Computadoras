section .data
msg: db "Hola Mundo", 0
len: db 10

section .text
global _start
global checklong

checklong:
push ebp
mov ebp, esp
push ebx
mov ebx, 0          ;cargo 0 en ebx que sera la longitud
mov eax, [ebp + 8]  ;caro la primera posicion del array en eax que lo barrera
ciclo:
cmp byte[eax], 0        ;si eax = 0 entonces termino el string
je fin
add ebx, 1          ;si no, le sumo 1 a la longitud
add eax, 1
jmp ciclo

fin:                ;si termine al calculado (ebx) le resto el informado
mov eax, [ebp + 12]
sub ebx, eax
mov eax, ebx        ;guardo en eax para devolver
mov ebx, [esp]      ;recupero ebx
add esp, 4
mov ebp, [ebp]      ;desarmo el stack frame
add esp, 4
ret

_start:
push dword[len]
push msg
call checklong
cmp eax, 0
je prueba
end:
mov eax, 1
int 80h
prueba:
mov eax, 4
mov ebx, 1
mov ecx, msg
mov edx, [len]
int 80h
jmp end