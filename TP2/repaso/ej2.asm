global _start
section .text
_start:
;imprimo la normal
mov eax, 4
mov ebx, 1
mov ecx, string
mov edx, len
int 80h
;
mov eax, string
ciclo:
cmp byte [eax], 0
je end
cmp byte [eax], 'a'
jl siguiente
cmp byte [eax], 'z'
jg siguiente
; CASO: entre a - z , debo hacerlo mayuscula
mov ebx, [eax]
sub byte ebx, diff
mov [eax], ebx
siguiente:
inc eax
jmp ciclo
end:
mov eax, 4
mov ebx, 1
mov ecx, string
mov edx, len
int 80h

;hago exit
mov eax, 1
mov ebx, 0
int 80h

section .data
string db "h4ppy c0d1ng", 10, 0
len equ $ - string ;lo hago con el final del string igual
diff equ 'a' - 'A'