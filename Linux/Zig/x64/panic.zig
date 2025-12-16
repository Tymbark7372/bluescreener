const std = @import("std");

pub fn main() void {
    const file = std.fs.openFileAbsolute("/proc/sysrq-trigger", .{ .mode = .write_only }) catch return;
    defer file.close();
    _ = file.write("c") catch {};
}

