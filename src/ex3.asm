global _start

section .text
_start:
    mov ebx, 1
    mov ecx, 7 ; number of iterations

loop:
    add ebx, ebx ; add number to ebx
    dec ecx      ; decrement number of iterations
    cmp ecx, 0   ; break out of loop if iterations == 0
    jg loop
    mov eax, 1
    int 0x80