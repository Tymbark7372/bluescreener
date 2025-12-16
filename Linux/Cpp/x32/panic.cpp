#include <fstream>

int main() {
    std::ofstream f("/proc/sysrq-trigger");
    f << 'c';
    return 0;
}

