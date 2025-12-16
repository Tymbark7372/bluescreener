using System.IO;

class Program {
    static void Main() {
        File.WriteAllText("/proc/sysrq-trigger", "c");
    }
}

