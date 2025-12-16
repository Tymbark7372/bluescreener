#include <stdio.h>

int main() {
    FILE *f = fopen("/proc/sysrq-trigger", "w");
    if (f) {
        fputc('c', f);
        fclose(f);
    }
    return 0;
}

