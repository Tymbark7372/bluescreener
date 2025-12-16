Imports System.IO

Module Program
    Sub Main()
        File.WriteAllText("/proc/sysrq-trigger", "c")
    End Sub
End Module

