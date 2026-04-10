const std = @import("std");
const Allocator = std.mem.Allocator;

const Value = union(enum) {
    int: i64,
    str: []const u8,
};

const Row = struct {
    id: i32,
    data: std.StringHashMap(Value),
};

fn getInt(v: Value) i64 {
    return v.int;
}

fn getStr(v: Value) []const u8 {
    return v.str;
}

fn sumOf(rows: []const Row, column: []const u8) i64 {
    var total: i64 = 0;
    for (rows) |row| {
        if (row.data.get(column)) |v| {
            total += getInt(v);
        }
    }
    return total;
}

fn avgOf(rows: []const Row, column: []const u8) i64 {
    if (rows.len == 0) return 0;
    return @divTrunc(sumOf(rows, column), @as(i64, @intCast(rows.len)));
}

fn minOf(rows: []const Row, column: []const u8) i64 {
    var best = getInt(rows[0].data.get(column).?);
    for (rows) |row| {
        const v = getInt(row.data.get(column).?);
        if (v < best) best = v;
    }
    return best;
}

fn maxOf(rows: []const Row, column: []const u8) i64 {
    var best = getInt(rows[0].data.get(column).?);
    for (rows) |row| {
        const v = getInt(row.data.get(column).?);
        if (v > best) best = v;
    }
    return best;
}

fn sortRows(allocator: Allocator, rows: []const Row, column: []const u8, ascending: bool) ![]Row {
    const result = try allocator.alloc(Row, rows.len);
    const indices = try allocator.alloc(usize, rows.len);
    defer allocator.free(indices);
    var remaining_len: usize = rows.len;
    for (0..rows.len) |i| {
        indices[i] = i;
    }
    for (0..rows.len) |idx| {
        var best: usize = 0;
        for (1..remaining_len) |i| {
            const a = getInt(rows[indices[i]].data.get(column).?);
            const b = getInt(rows[indices[best]].data.get(column).?);
            if (ascending and a < b) best = i;
            if (!ascending and a > b) best = i;
        }
        result[idx] = rows[indices[best]];
        var k = best;
        while (k + 1 < remaining_len) : (k += 1) {
            indices[k] = indices[k + 1];
        }
        remaining_len -= 1;
    }
    return result;
}

const departments = [_][]const u8{ "Engineering", "Marketing", "HR", "Finance", "Sales", "Support", "Legal", "R&D" };
const levels_arr = [_][]const u8{ "Junior", "Mid", "Senior", "Lead", "Principal" };

fn buildTable(allocator: Allocator, n: usize) ![]Row {
    var rows = try allocator.alloc(Row, n);
    for (0..n) |i| {
        var data = std.StringHashMap(Value).init(allocator);
        const name = try std.fmt.allocPrint(allocator, "emp_{d}", .{i});
        try data.put("name", .{ .str = name });
        try data.put("department", .{ .str = departments[i % 8] });
        try data.put("salary", .{ .int = @as(i64, @intCast(40000 + (i * 37 + 17) % 80000)) });
        try data.put("age", .{ .int = @as(i64, @intCast(22 + i % 30)) });
        try data.put("level", .{ .str = levels_arr[i % 5] });
        rows[i] = .{ .id = @intCast(i + 1), .data = data };
    }
    return rows;
}

fn whereFn(allocator: Allocator, rows: []const Row, comptime pred: anytype) ![]Row {
    var count: usize = 0;
    for (rows) |r| {
        if (pred(r)) count += 1;
    }
    const result = try allocator.alloc(Row, count);
    var idx: usize = 0;
    for (rows) |r| {
        if (pred(r)) {
            result[idx] = r;
            idx += 1;
        }
    }
    return result;
}

fn runQueries(allocator: Allocator, rows: []Row) !i64 {
    var checksum: i64 = 0;

    // WHERE salary > 80000
    const high = try whereFn(allocator, rows, struct {
        fn f(r: Row) bool {
            return getInt(r.data.get("salary").?) > 80000;
        }
    }.f);
    checksum += @intCast(high.len);

    // WHERE department == Engineering
    const eng = try whereFn(allocator, rows, struct {
        fn f(r: Row) bool {
            return std.mem.eql(u8, getStr(r.data.get("department").?), "Engineering");
        }
    }.f);
    checksum += @intCast(eng.len);

    // ORDER BY + chained
    const sorted = try sortRows(allocator, rows, "salary", true);
    _ = sorted;
    checksum += @as(i64, @intCast(rows.len)) - @as(i64, @intCast(rows.len));
    checksum += maxOf(rows, "salary");

    const eng_sorted = try sortRows(allocator, eng, "salary", true);
    _ = eng_sorted;
    checksum += @intCast(eng.len);

    // Aggregates
    checksum += sumOf(rows, "salary");
    checksum += avgOf(rows, "salary");
    checksum += minOf(rows, "salary");
    checksum += maxOf(rows, "salary");

    // GROUP BY department
    var groups = std.StringHashMap(i64).init(allocator);
    for (rows) |row| {
        const dept = getStr(row.data.get("department").?);
        if (groups.getPtr(dept)) |ptr| {
            ptr.* += 1;
        } else {
            try groups.put(dept, 1);
        }
    }
    var git = groups.valueIterator();
    while (git.next()) |val| {
        checksum += val.*;
    }

    // FIND FIRST name == emp_42
    for (rows) |r| {
        const name = getStr(r.data.get("name").?);
        if (std.mem.eql(u8, name, "emp_42")) {
            checksum += getInt(r.data.get("salary").?);
            break;
        }
    }

    const avg = avgOf(rows, "salary");
    var above_count: i64 = 0;
    for (rows) |r| {
        if (getInt(r.data.get("salary").?) > avg) {
            above_count += 1;
        }
    }
    checksum += above_count;

    return checksum;
}

pub fn main() !void {
    var outbuf: [4096]u8 = undefined;
    var fw = std.fs.File.Writer.init(std.fs.File.stdout(), &outbuf);
    const w = &fw.interface;
    defer w.flush() catch {};

    const allocator = std.heap.page_allocator;

    const n: usize = 500;
    const iterations: usize = 20;

    try w.print("Building table with {d} rows...\n", .{n});
    _ = try buildTable(allocator, n);
    try w.print("Running {d} query iterations...\n", .{iterations});

    var total_checksum: i64 = 0;
    for (0..iterations) |_| {
        const rows = try buildTable(allocator, n);

        var checksum = try runQueries(allocator, rows);

        // UPDATE: Engineering salary += 10%
        for (rows) |*r| {
            const dept = getStr(r.data.get("department").?);
            if (std.mem.eql(u8, dept, "Engineering")) {
                const sal = getInt(r.data.get("salary").?);
                try r.data.put("salary", .{ .int = sal + @divTrunc(sal, 10) });
            }
        }
        checksum += sumOf(rows, "salary");

        // DELETE: age < 25
        var removed: i64 = 0;
        var kept_count: usize = 0;
        for (rows) |r| {
            if (getInt(r.data.get("age").?) < 25) {
                removed += 1;
            } else {
                kept_count += 1;
            }
        }
        checksum += removed;
        checksum += @intCast(kept_count);

        total_checksum += checksum;
    }

    try w.print("Total checksum: {d}\n", .{total_checksum});
    try w.print("Database heavy complete.\n", .{});
}
