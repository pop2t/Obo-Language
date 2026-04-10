const std = @import("std");

fn evalA(i: usize, j: usize) f64 {
    const ij = i + j;
    return 1.0 / @as(f64, @floatFromInt(ij * (ij + 1) / 2 + i + 1));
}

fn evalATimesU(u: []const f64, n: usize, au: []f64) void {
    for (0..n) |i| {
        var sum: f64 = 0.0;
        for (0..n) |j| {
            sum += evalA(i, j) * u[j];
        }
        au[i] = sum;
    }
}

fn evalAtTimesU(u: []const f64, n: usize, atu: []f64) void {
    for (0..n) |i| {
        var sum: f64 = 0.0;
        for (0..n) |j| {
            sum += evalA(j, i) * u[j];
        }
        atu[i] = sum;
    }
}

fn evalAtATimesU(u: []const f64, n: usize, atau: []f64, tmp: []f64) void {
    evalATimesU(u, n, tmp);
    evalAtTimesU(tmp, n, atau);
}

pub fn main() !void {
    var outbuf: [4096]u8 = undefined;
    var fw = std.fs.File.Writer.init(std.fs.File.stdout(), &outbuf);
    const w = &fw.interface;
    defer w.flush() catch {};

    const allocator = std.heap.page_allocator;

    const n: usize = 1000;

    const u = try allocator.alloc(f64, n);
    defer allocator.free(u);
    const v = try allocator.alloc(f64, n);
    defer allocator.free(v);
    const tmp = try allocator.alloc(f64, n);
    defer allocator.free(tmp);

    for (0..n) |i| {
        u[i] = 1.0;
        v[i] = 0.0;
    }

    for (0..10) |_| {
        evalAtATimesU(u, n, v, tmp);
        evalAtATimesU(v, n, u, tmp);
    }

    var vBv: f64 = 0.0;
    var vv: f64 = 0.0;
    for (0..n) |i| {
        vBv += u[i] * v[i];
        vv += v[i] * v[i];
    }

    try w.print("Spectral norm: {d:.9}\n", .{@sqrt(vBv / vv)});
}
