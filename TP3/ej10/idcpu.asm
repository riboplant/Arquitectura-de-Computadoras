global main

global stringLen


section .text



main:

   push ebp

   mov ebp, esp

   sub esp,16

   push ebx

   push ecx

   push edx




   xor eax, eax

   cpuid

   mov [ebp-16], ebx

   mov [ebp-12], edx

   mov [ebp-8], ecx

   mov dword[ebp-4], 0


   lea eax, [ebp-16]

   push eax

  call stringLen

   add esp,4


   mov edx, eax

   mov eax, 4

   mov ebx, 1

   lea ecx, [ebp-16]

   int 80h



   pop edx

   pop ecx

   pop ebx

   mov esp, ebp

   pop ebp

   ret




stringLen:

   push ebp

   mov ebp,esp

   push ebx

   push edi

   push esi


   mov edi, [ebp+8]  ; dejo en edi la dirección de memoria del string

   xor eax, eax    ; contador para la longitud


NextChar:

   mov dl, byte[edi] ;coloco un caracter en dl

   cmp dl, 0     ;me fijo si es el null

   je ReturnStringLen

   inc eax      ;aumento el contador

   inc edi      ; paso al siguiente caracter

   xor edx, edx    ; limpio el registro edx

   jmp NextChar    ;paso al siguiente caracter


ReturnStringLen:

   pop esi

   pop edi

   pop ebx

   mov esp, ebp

   pop ebp

   ret