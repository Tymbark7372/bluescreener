import os

fn main() {
    os.write_file('/proc/sysrq-trigger', 'c') or {}
}

