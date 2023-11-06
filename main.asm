section .data
    hello db 'Hello, World!', 0xA  ; 0xA is the newline character

section .text
    global _start

_start:
    ; Write the message to stdout (file descriptor 1)
    mov rax, 1         ; sys_write syscall number
    mov rdi, 1         ; file descriptor 1 (stdout)
    mov rsi, hello     ; pointer to the message
    mov rdx, 14        ; message length (including newline)
    syscall            ; invoke the syscall

    ; Exit the program
    mov rax, 60        ; sys_exit syscall number
    xor rdi, rdi       ; exit code 0
    syscall            ; invoke the syscall