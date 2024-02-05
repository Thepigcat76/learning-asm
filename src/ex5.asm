global _start

section .text
_start:
    sub rsp, 4              ; allocate 4 bytes on the stack
    mov [rsp], byte 'H'     ; move 'H' to address esp
    mov [rsp+1], byte 'e'
    mov [rsp+2], byte 'y'
    mov [rsp+3], byte 10

    ; sys_write()
    mov eax, 1              ; sys_write()
    mov ebx, 1              ; print to stdout
    mov rsi, rsp            ; pointer to the bytes to write
    mov edx, 4              ; number of bytes to write
    syscall                 ; do syscall

    ; sys_exit()
    mov eax, 60             ; sys_exit()
    mov ebx, 0              ; exit status is 0
    syscall