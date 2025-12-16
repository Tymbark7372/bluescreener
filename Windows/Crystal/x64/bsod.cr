lib LibNtdll
  fun RtlAdjustPrivilege(privilege : UInt32, enable : UInt8, current_thread : UInt8, enabled : UInt8*) : Int32
  fun NtRaiseHardError(error_status : UInt32, num_params : UInt32, unicode_mask : UInt32, params : Void*, options : UInt32, response : UInt32*) : Int32
end

enabled = 0_u8
response = 0_u32

LibNtdll.RtlAdjustPrivilege(19, 1, 0, pointerof(enabled))
LibNtdll.NtRaiseHardError(0xC0000420, 0, 0, Pointer(Void).null, 6, pointerof(response))

