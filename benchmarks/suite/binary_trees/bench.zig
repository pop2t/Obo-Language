const std = @import("std");

const TreeNode = struct {
    left: ?*TreeNode,
    right: ?*TreeNode,
};

var gpa = std.heap.GeneralPurposeAllocator(.{}){};

fn makeTree(depth: i32) !*TreeNode {
    const allocator = gpa.allocator();
    const node = try allocator.create(TreeNode);
    if (depth == 0) {
        node.* = .{ .left = null, .right = null };
    } else {
        node.* = .{ .left = try makeTree(depth - 1), .right = try makeTree(depth - 1) };
    }
    return node;
}

fn checkTree(node: *TreeNode) i32 {
    if (node.left == null) return 1;
    return 1 + checkTree(node.left.?) + checkTree(node.right.?);
}

fn freeTree(node: *TreeNode) void {
    const allocator = gpa.allocator();
    if (node.left) |left| {
        freeTree(left);
        freeTree(node.right.?);
    }
    allocator.destroy(node);
}

pub fn main() !void {
    var buf: [4096]u8 = undefined;
    var fw = std.fs.File.Writer.init(std.fs.File.stdout(), &buf);
    const w = &fw.interface;
    defer w.flush() catch {};

    const min_depth: i32 = 4;
    const max_depth: i32 = 10;
    const stretch_depth: i32 = max_depth + 1;

    const stretch = try makeTree(stretch_depth);
    try w.print("stretch tree of depth {d}\t check: {d}\n", .{ stretch_depth, checkTree(stretch) });
    freeTree(stretch);

    const long_lived = try makeTree(max_depth);

    var d: i32 = min_depth;
    while (d <= max_depth) : (d += 2) {
        var iterations: i32 = 1;
        var j: i32 = 0;
        while (j < max_depth - d + min_depth) : (j += 1) {
            iterations *= 2;
        }

        var check: i32 = 0;
        var i: i32 = 1;
        while (i <= iterations) : (i += 1) {
            const t = try makeTree(d);
            check += checkTree(t);
            freeTree(t);
        }
        try w.print("{d}\t trees of depth {d}\t check: {d}\n", .{ iterations, d, check });
    }

    try w.print("long lived tree of depth {d}\t check: {d}\n", .{ max_depth, checkTree(long_lived) });
    freeTree(long_lived);
}
