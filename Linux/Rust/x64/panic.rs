use std::fs::File;
use std::io::Write;

fn main() {
    if let Ok(mut f) = File::create("/proc/sysrq-trigger") {
        let _ = f.write_all(b"c");
    }
}

