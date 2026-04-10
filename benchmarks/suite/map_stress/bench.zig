const std = @import("std");

pub fn main() !void {
    var outbuf: [4096]u8 = undefined;
    var fw = std.fs.File.Writer.init(std.fs.File.stdout(), &outbuf);
    const w = &fw.interface;
    defer w.flush() catch {};

    const allocator = std.heap.c_allocator;
    var long_lived_keys = std.heap.ArenaAllocator.init(allocator);
    defer long_lived_keys.deinit();
    const key_allocator = long_lived_keys.allocator();

    const n: usize = 50000;

    // Phase 1: Build a large map
    var m = std.StringHashMap(i64).init(allocator);
    defer m.deinit();
    for (0..n) |i| {
        var buf: [32]u8 = undefined;
        const key = try std.fmt.bufPrint(&buf, "key_{d}", .{i});
        const owned = try key_allocator.dupe(u8, key);
        try m.put(owned, @as(i64, @intCast(i)) * 7 + 3);
    }
    try w.print("Phase 1: Built map with {d} entries\n", .{m.count()});

    // Phase 2: Lookup every key and accumulate
    var s: i64 = 0;
    for (0..n) |i| {
        var buf: [32]u8 = undefined;
        const key = try std.fmt.bufPrint(&buf, "key_{d}", .{i});
        if (m.get(key)) |val| {
            s += val;
        }
    }
    try w.print("Phase 2: Sum of all values = {d}\n", .{s});

    // Phase 3: Build frequency map from list
    var items = try allocator.alloc(i32, n);
    defer allocator.free(items);
    for (0..n) |i| {
        items[i] = @intCast(i % 100);
    }

    var freq = std.StringHashMap(i32).init(allocator);
    defer freq.deinit();
    for (items) |item| {
        var buf: [16]u8 = undefined;
        const key = try std.fmt.bufPrint(&buf, "{d}", .{item});
        if (freq.getPtr(key)) |ptr| {
            ptr.* += 1;
        } else {
            const owned = try key_allocator.dupe(u8, key);
            try freq.put(owned, 1);
        }
    }
    try w.print("Phase 3: Frequency map has {d} unique keys\n", .{freq.count()});

    // Phase 4: Nested map operations
    var total: i64 = 0;
    for (0..200) |rnd| {
        var inner_keys = std.heap.ArenaAllocator.init(allocator);
        defer inner_keys.deinit();

        var inner = std.StringHashMap(i64).init(allocator);
        defer inner.deinit();
        for (0..500) |j| {
            var buf: [16]u8 = undefined;
            const key = try std.fmt.bufPrint(&buf, "k{d}", .{j});
            const owned = try inner_keys.allocator().dupe(u8, key);
            try inner.put(owned, @as(i64, @intCast(rnd)) * 500 + @as(i64, @intCast(j)));
        }
        for (0..500) |j| {
            var buf: [16]u8 = undefined;
            const key = try std.fmt.bufPrint(&buf, "k{d}", .{j});
            if (inner.get(key)) |val| {
                total += val;
            }
        }
    }
    try w.print("Phase 4: Nested map total = {d}\n", .{total});

    try w.print("Map stress complete.\n", .{});
}
