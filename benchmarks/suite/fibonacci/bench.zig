const std = @import("std");

fn fib(n: i32) i32 {
    if (n < 2) return n;
    return fib(n - 1) + fib(n - 2);
}

pub fn main() !void {
    var buf: [4096]u8 = undefined;
    var fw = std.fs.File.Writer.init(std.fs.File.stdout(), &buf);
    const w = &fw.interface;
    defer w.flush() catch {};
    const result = fib(35);
    try w.print("fib(35) = {d}\n", .{result});
}
