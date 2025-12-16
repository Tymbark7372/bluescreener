section .data
    path db "/proc/sysrq-trigger", 0
    cmd db "c"

section .text
    global _start

_start:
    mov rax, 2
    mov rdi, path
    mov rsi, 1
    syscall
    
    mov rdi, rax
    mov rax, 1
    mov rsi, cmd
    mov rdx, 1
    syscall
    
    mov rax, 60
    xor rdi, rdi
    syscall

