section .text
global _start

_start:
    call func

    ; Exit system call for 64-bit
    mov rax, 1         ; syscall number for exit
    mov rbx, 0
    int 0x80

func:
    push rbp
    mov rbp, rsp ; use the base pointer registry to store the original stack pointer
    ; Allocate memory on the stack
    sub rsp, 3
    mov [rsp], byte 'H'
    mov [rsp+1], byte 'i'
    mov [rsp+2], byte 0xA

    mov rax, 1              ; sys_write()
    mov rbx, 1              ; print to stdout
    mov rsi, rsp            ; pointer to the bytes to write
    mov rdx, 4              ; number of bytes to write
    syscall                 ; do syscall

    mov rsp, rbp ; restore the original stack pointer using the register
    pop rbp
    ret

