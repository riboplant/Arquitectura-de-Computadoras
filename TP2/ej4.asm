section .text
global _start
extern print
extern exit
extern numtostr

_start:
push eax
push ebx
mov eax, n
mov ebx, 0

ciclo:
cmp dword eax, 0
jz end

add ebx, eax
dec eax
jmp ciclo

end:
push placeholder
push ebx
call numtostr
mov ebx, [esp + 4]
call print
pop ebx
pop eax
call exit

section .data
n equ 4

section .bss
placeholder resb 64