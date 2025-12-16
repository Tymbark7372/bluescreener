section .data
    path db "/proc/sysrq-trigger", 0
    cmd db "c"

section .text
    global _start

_start:
    mov eax, 5
    mov ebx, path
    mov ecx, 1
    int 0x80
    
    mov ebx, eax
    mov eax, 4
    mov ecx, cmd
    mov edx, 1
    int 0x80
    
    mov eax, 1
    xor ebx, ebx
    int 0x80

