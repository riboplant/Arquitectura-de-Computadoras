section .text
global randstart
global randgen

randgen:
;i could modify the code and add here a loop for larger numbers
randstart:              
    push ebp             ; stack frame building
    mov ebp, esp
    push ebx             ; preserve ebx
    mov ebx, ebp         ; pointer 
    add ebx, 8
    mov ebx, [ebx]
    mov eax, 13          ; setting syscall id for time    
    int 80h              ; ebx points to an int and its value is the time since midnight

    mov  eax, [ebp+8]
    mov eax, [eax]  

                         ; setting the range between 0 - 36
    xor  edx, edx        ; setting edx in 0
    mov ecx, 37
    div ecx               ; now eax has the result and edx the rest (its what i want)
    mov eax, edx         ; setting thhe return value

    ;moooore random
    add eax, eax
    add eax, eax        ;now its between 0 - 108
    cmp eax, 54
    jl rand1
    sub eax, 12
    mov ecx, 9
    mov edx, 0
    mul ecx
    jmp redo
rand1:
    add eax, 25
    mov ecx, 7
    mov edx, 0
    mul ecx
    jmp redo

redo:
    mov ecx, 15
    mov edx, 0
    mul ecx
    mov edx, 0
    mov ecx, 37
    sub eax, 2
    div ecx
    mov eax, edx
    jmp end

end:
    pop ebx     
    mov esp, ebp         ; stack frame dissassembly
    pop ebp
    ret                  ; in eax is the random value between 0 - 36
