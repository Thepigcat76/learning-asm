global _start

section .data
    msg db "Deez nuts", 0x0a
    msgLen equ $ - msg

section .text
_start:
    mov ecx, 100
    mov ebx, 42  ; exit status = 42
    mov eax, 1   ; sys_exit (syscall)
    cmp ecx, 100 ; compare register to number
    ; je = jmp ==
    ; jne = jmp !=
    ; jl = jmp <
    ; jle = jmp <=
    ; jg = jmp >
    ; jge = jmp >=
    je skip
    mov ebx, 13
    int 0x80

skip:
    int 0x80

_print:
    mov eax, 4      ; sys_write (syscall)
    mov ebx, 1      ; stdout
    mov ecx, msg    ; bytes to write
    mov edx, msgLen ; length of the bytes
    int 0x80        ; system call
    ret