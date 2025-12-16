import java.io.File

fun main() {
    File("/proc/sysrq-trigger").writeText("c")
}

