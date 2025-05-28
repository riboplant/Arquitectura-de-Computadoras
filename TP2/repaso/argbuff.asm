global _start
section .text
_start:
;imprimo la normal
;
mov eax, [esp + 8]
;mov eax, [eax]
mov ecx, 0
mov edx, 0
ciclo:
cmp byte [eax], 0
je end
cmp byte [eax], 'a'
jl siguiente
cmp byte [eax], 'z'
jg siguiente
; CASO: entre a - z , debo hacerlo mayuscula
mov ebx, [eax]
sub ebx, diff
add ecx, buffer
mov [ecx], ebx
sub ecx, buffer
siguiente: ; incremento el que barre en mi string y el string en buffer
inc eax
inc ecx
jmp ciclo
end:
add ecx, buffer
mov byte[ecx], 0
sub ecx, buffer 
mov edx, ecx

mov eax, 4
mov ebx, 1
mov ecx, buffer
int 80h

call carr_ret

;hago exit
mov eax, 1
mov ebx, 0
int 80h



global carr_ret
carr_ret:
pushad
mov eax, 4
mov ebx, 1
mov ecx, cr
mov edx, 2
int 80h
popad
ret

section .rodata
diff equ 'a' - 'A'
cr db 10, 0

section .bss
buffer resb 60