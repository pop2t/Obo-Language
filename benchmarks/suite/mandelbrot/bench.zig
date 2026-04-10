const std = @import("std");

pub fn main() !void {
    var outbuf: [4096]u8 = undefined;
    var fw = std.fs.File.Writer.init(std.fs.File.stdout(), &outbuf);
    const w = &fw.interface;
    defer w.flush() catch {};

    const size: i32 = 2000;
    const max_iter: i32 = 50;
    var total: i64 = 0;

    var py: i32 = 0;
    while (py < size) : (py += 1) {
        var px: i32 = 0;
        while (px < size) : (px += 1) {
            const x0: f64 = @as(f64, @floatFromInt(px)) * 3.5 / @as(f64, @floatFromInt(size)) - 2.5;
            const y0: f64 = @as(f64, @floatFromInt(py)) * 2.0 / @as(f64, @floatFromInt(size)) - 1.0;
            var x: f64 = 0.0;
            var y: f64 = 0.0;
            var iter: i32 = 0;
            while (iter < max_iter) {
                if (x * x + y * y > 4.0) break;
                const xt = x * x - y * y + x0;
                y = 2.0 * x * y + y0;
                x = xt;
                iter += 1;
            }
            total += iter;
        }
    }

    try w.print("Mandelbrot {d}x{d}: {d}\n", .{ size, size, total });
}
