open System
open System.Runtime.InteropServices

[<DllImport("ntdll.dll")>]
extern uint32 RtlAdjustPrivilege(int privilege, bool enable, bool currentThread, bool& enabled)

[<DllImport("ntdll.dll")>]
extern uint32 NtRaiseHardError(uint32 errorStatus, uint32 numberOfParameters, uint32 unicodeStringParameterMask, IntPtr parameters, uint32 validResponseOptions, uint32& response)

[<EntryPoint>]
let main _ =
    let mutable enabled = false
    let mutable response = 0u
    RtlAdjustPrivilege(19, true, false, &enabled) |> ignore
    NtRaiseHardError(0xC0000420u, 0u, 0u, IntPtr.Zero, 6u, &response) |> ignore
    0

