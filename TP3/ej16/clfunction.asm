section .text
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
mov eax, [ebp+12]
sub ebx, eax
mov eax, ebx        ;guardo en eax para devolver
mov ebx, [esp]      ;recupero ebx
add esp, 4
mov ebp, [ebp]      ;desarmo el stack frame
add esp, 4
ret