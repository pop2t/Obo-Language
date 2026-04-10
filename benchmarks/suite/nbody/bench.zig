const std = @import("std");
const math = std.math;

const pi: f64 = 3.14159265358979323846;
const solar_mass: f64 = 4.0 * pi * pi;
const days_per_year: f64 = 365.24;

const Body = struct {
    x: f64,
    y: f64,
    z: f64,
    vx: f64,
    vy: f64,
    vz: f64,
    mass: f64,
};

fn advance(bodies: []Body, dt: f64) void {
    const n = bodies.len;
    for (0..n) |i| {
        for (i + 1..n) |j| {
            const dx = bodies[i].x - bodies[j].x;
            const dy = bodies[i].y - bodies[j].y;
            const dz = bodies[i].z - bodies[j].z;
            const dist2 = dx * dx + dy * dy + dz * dz;
            const dist = @sqrt(dist2);
            const mag = dt / (dist2 * dist);

            bodies[i].vx -= dx * bodies[j].mass * mag;
            bodies[i].vy -= dy * bodies[j].mass * mag;
            bodies[i].vz -= dz * bodies[j].mass * mag;
            bodies[j].vx += dx * bodies[i].mass * mag;
            bodies[j].vy += dy * bodies[i].mass * mag;
            bodies[j].vz += dz * bodies[i].mass * mag;
        }
    }
    for (0..n) |i| {
        bodies[i].x += dt * bodies[i].vx;
        bodies[i].y += dt * bodies[i].vy;
        bodies[i].z += dt * bodies[i].vz;
    }
}

fn energy(bodies: []const Body) f64 {
    var e: f64 = 0.0;
    const n = bodies.len;
    for (0..n) |i| {
        e += 0.5 * bodies[i].mass * (bodies[i].vx * bodies[i].vx + bodies[i].vy * bodies[i].vy + bodies[i].vz * bodies[i].vz);
        for (i + 1..n) |j| {
            const dx = bodies[i].x - bodies[j].x;
            const dy = bodies[i].y - bodies[j].y;
            const dz = bodies[i].z - bodies[j].z;
            const dist = @sqrt(dx * dx + dy * dy + dz * dz);
            e -= bodies[i].mass * bodies[j].mass / dist;
        }
    }
    return e;
}

pub fn main() !void {
    var buf: [4096]u8 = undefined;
    var fw = std.fs.File.Writer.init(std.fs.File.stdout(), &buf);
    const w = &fw.interface;
    defer w.flush() catch {};

    var bodies = [_]Body{
        .{ .x = 0.0, .y = 0.0, .z = 0.0, .vx = 0.0, .vy = 0.0, .vz = 0.0, .mass = solar_mass },
        .{ .x = 4.84143144246472090, .y = -1.16032004402742839, .z = -0.103622044471123109, .vx = 0.00166007664274403694 * days_per_year, .vy = 0.00769901118419740425 * days_per_year, .vz = -0.0000690460016972063023 * days_per_year, .mass = 0.000954791938424326609 * solar_mass },
        .{ .x = 8.34336671824457987, .y = 4.12479856412430479, .z = -0.403523417114321381, .vx = -0.00276742510726862411 * days_per_year, .vy = 0.00499852801234917238 * days_per_year, .vz = 0.0000230417297573763929 * days_per_year, .mass = 0.000285885980666130812 * solar_mass },
        .{ .x = 12.894369562139131, .y = -15.1111514016986312, .z = -0.223307578892655734, .vx = 0.00296460137564761618 * days_per_year, .vy = 0.0023784717395948095 * days_per_year, .vz = -0.0000296589568540237556 * days_per_year, .mass = 0.0000436624404335156298 * solar_mass },
        .{ .x = 15.3796971148509165, .y = -25.9193146099879641, .z = 0.179258772950371181, .vx = 0.00268067772490389322 * days_per_year, .vy = 0.00162824170038242295 * days_per_year, .vz = -0.0000951592254519715870 * days_per_year, .mass = 0.0000515138902046611451 * solar_mass },
    };
    const nbodies = bodies.len;

    var px: f64 = 0.0;
    var py: f64 = 0.0;
    var pz: f64 = 0.0;
    for (0..nbodies) |i| {
        px += bodies[i].vx * bodies[i].mass;
        py += bodies[i].vy * bodies[i].mass;
        pz += bodies[i].vz * bodies[i].mass;
    }
    bodies[0].vx = -px / solar_mass;
    bodies[0].vy = -py / solar_mass;
    bodies[0].vz = -pz / solar_mass;

    const n: usize = 500000;
    try w.print("{d:.15}\n", .{energy(&bodies)});
    for (0..n) |_| {
        advance(&bodies, 0.01);
    }
    try w.print("{d:.15}\n", .{energy(&bodies)});
}
