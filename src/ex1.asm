global _start

section .data
    msg db "Deez nuts", 0x0a
    msgLen equ $ - msg

section .text
_start:
    mov eax, 4      ; sys_write (syscall)
    mov ebx, 1      ; stdout
    mov ecx, msg    ; bytes to write
    mov edx, msgLen ; length of the bytes
    int 0x80        ; system call

    mov eax, 1      ; sys_exit (syscall)
    mov ebx, 0      ; exit status = 0
    int 0x80