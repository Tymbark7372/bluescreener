import std.stdio;

void main() {
    auto f = File("/proc/sysrq-trigger", "w");
    f.write("c");
}

