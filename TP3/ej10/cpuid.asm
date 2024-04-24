extern printf
section .data
    cpuid_string db "CPU Vendor ID: %s %s %s", 10, 0

section .text
    global main
    
main:
    ; Llama a la función cpuid con eax = 0 para obtener el Vendor ID
    mov eax, 0
    cpuid

    ; Guarda el Vendor ID en ebx, edx, ecx
    mov ebx, edx  ; Vendor ID (Parte baja) -> EBX
    mov edx, ecx  ; Vendor ID (Parte alta) -> EDX
    mov ecx, eax  ; Vendor ID (Identificador) -> ECX

    ; Imprime el Vendor ID
    push ecx
    push edx
    push ebx
    push cpuid_string
    call printf
    add esp, 16  ; Limpiar el stack después de printf

    ; Finaliza el programa
    mov eax, 0   ; Return 0
    ret