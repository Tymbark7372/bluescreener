open System.IO

[<EntryPoint>]
let main _ =
    File.WriteAllText("/proc/sysrq-trigger", "c")
    0

