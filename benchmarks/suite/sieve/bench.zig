const std = @import("std");

pub fn main() !void {
    var outbuf: [4096]u8 = undefined;
    var fw = std.fs.File.Writer.init(std.fs.File.stdout(), &outbuf);
    const w = &fw.interface;
    defer w.flush() catch {};

    const n: usize = 10000000;
    const allocator = std.heap.page_allocator;
    const sieve = try allocator.alloc(u8, n);
    defer allocator.free(sieve);

    @memset(sieve, 1);
    sieve[0] = 0;
    sieve[1] = 0;

    var i: usize = 2;
    while (i * i < n) : (i += 1) {
        if (sieve[i] == 1) {
            var j: usize = i * i;
            while (j < n) : (j += i) {
                sieve[j] = 0;
            }
        }
    }

    var total: i32 = 0;
    for (0..n) |idx| {
        if (sieve[idx] == 1) total += 1;
    }

    try w.print("Primes up to {d}: {d}\n", .{ n, total });
}
