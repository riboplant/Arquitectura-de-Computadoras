section .text
global _start
extern numtostr
extern exit

_start:
push eax
push ebx
push ecx
push edx
mov eax, 1
mov ebx, n
mov edx, 0

ciclo:
cmp ebx, 1
jz end

mul dword ebx
dec ebx
jmp ciclo

end:
push placeholder
push eax
call numtostr
pop edx
pop ecx
pop ebx
pop eax
call exit

section .data
n equ 5

section .bss
placeholder resb 64