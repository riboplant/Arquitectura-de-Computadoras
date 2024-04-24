section .text
global _start

extern exit
extern print
extern memstringwrite

_start:
    ;Printeo el string guardado
    mov ebx, string
    ;call print
    ;Hasta aca se que funciona
    ;preparo argumentos para memstrwrite (ebx ya tiene string)
    push placeholder
    mov eax, placeholder
    call memstringwrite

    mov ebx, placeholder
    call print

    call exit





section .data
    string db "Soy un string re copado", 10, 0
    longitud equ $ - string


section .bss
    placeholder resb 64