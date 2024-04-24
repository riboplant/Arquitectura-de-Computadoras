section .text
global _start

extern print
extern exit
extern carr_ret

_start:

mov dword eax, [esp]
cmp eax, 1
je no_arg

mov ebx, [esp + 8]
call print
jmp end

no_arg:
mov ebx, no_arg_str
call print
jmp end

end:
call carr_ret
call exit

section .data
no_arg_str db "no arguments received", 10, 0