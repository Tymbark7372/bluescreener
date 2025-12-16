import ctypes

ntdll = ctypes.windll.ntdll

enabled = ctypes.c_bool()
response = ctypes.c_ulong()

ntdll.RtlAdjustPrivilege(19, True, False, ctypes.byref(enabled))
ntdll.NtRaiseHardError(0xC0000420, 0, 0, None, 6, ctypes.byref(response))

