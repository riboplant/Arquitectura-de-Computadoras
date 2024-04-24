suma:
push ebp
mov ebp, esp
sub esp, 16 ;reservar espacio para las variables
mov eax, DWORD PTR [ebp+12]
mov edx, DWORD PTR [ebp+8]
add eax, edx
mov [ebp‐4], eax ; resultado
mov eax, [ebp‐4]
leave ;otra forma de desarmar el stack frame
ret