global _start

section .data
    addr db "yellow", 0xA
    addrLen equ $ - addr

section .text
_start:
    ; string manipulation by changing byte
    ; at a memory address instead of a register
    mov [addr], byte 'H'
    mov eax, addr
    mov ebx, addrLen
    add eax, ebx
    sub eax, 2
    mov [eax], byte '!'
    mov eax, 4
    mov ebx, 1
    mov ecx, addr,
    mov edx, addrLen
    int 0x80

    mov eax, 1
    mov ebx, 0
    int 0x80
