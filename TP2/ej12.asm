section .text
global _start

extern numtostr

_start:
mov eax, esp
mov ebx, 0

ciclo:
inc eax
inc ebx
mov dword [eax], 1 
push placeholder
push ebx
call numtostr


jmp ciclo


section .bss
placeholder resb 32