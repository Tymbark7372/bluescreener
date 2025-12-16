Imports System
Imports System.Runtime.InteropServices

Module Program
    <DllImport("ntdll.dll")>
    Function RtlAdjustPrivilege(Privilege As Integer, Enable As Boolean, CurrentThread As Boolean, ByRef Enabled As Boolean) As UInteger
    End Function

    <DllImport("ntdll.dll")>
    Function NtRaiseHardError(ErrorStatus As UInteger, NumberOfParameters As UInteger, UnicodeStringParameterMask As UInteger, Parameters As IntPtr, ValidResponseOptions As UInteger, ByRef Response As UInteger) As UInteger
    End Function

    Sub Main()
        Dim enabled As Boolean
        Dim response As UInteger
        RtlAdjustPrivilege(19, True, False, enabled)
        NtRaiseHardError(&HC0000420UI, 0, 0, IntPtr.Zero, 6, response)
    End Sub
End Module

