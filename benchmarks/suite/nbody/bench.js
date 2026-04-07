var PI = Math.PI;
var SOLAR_MASS = 4.0 * PI * PI;
var DAYS_PER_YEAR = 365.24;

function Body(x, y, z, vx, vy, vz, mass) {
    return { x: x, y: y, z: z, vx: vx, vy: vy, vz: vz, mass: mass };
}

function advance(bodies, nbodies, dt) {
    for (var i = 0; i < nbodies; i++) {
        var bi = bodies[i];
        for (var j = i + 1; j < nbodies; j++) {
            var bj = bodies[j];
            var dx = bi.x - bj.x;
            var dy = bi.y - bj.y;
            var dz = bi.z - bj.z;
            var dist2 = dx * dx + dy * dy + dz * dz;
            var dist = Math.sqrt(dist2);
            var mag = dt / (dist2 * dist);

            bi.vx -= dx * bj.mass * mag;
            bi.vy -= dy * bj.mass * mag;
            bi.vz -= dz * bj.mass * mag;
            bj.vx += dx * bi.mass * mag;
            bj.vy += dy * bi.mass * mag;
            bj.vz += dz * bi.mass * mag;
        }
    }

    for (var i = 0; i < nbodies; i++) {
        var bi = bodies[i];
        bi.x += dt * bi.vx;
        bi.y += dt * bi.vy;
        bi.z += dt * bi.vz;
    }
}

function energy(bodies, nbodies) {
    var e = 0.0;
    for (var i = 0; i < nbodies; i++) {
        var bi = bodies[i];
        e += 0.5 * bi.mass * (bi.vx * bi.vx + bi.vy * bi.vy + bi.vz * bi.vz);
        for (var j = i + 1; j < nbodies; j++) {
            var bj = bodies[j];
            var dx = bi.x - bj.x;
            var dy = bi.y - bj.y;
            var dz = bi.z - bj.z;
            var dist = Math.sqrt(dx * dx + dy * dy + dz * dz);
            e -= bi.mass * bj.mass / dist;
        }
    }
    return e;
}

function main() {
    var sun = Body(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, SOLAR_MASS);

    var jupiter = Body(
        4.84143144246472090,
        -1.16032004402742839,
        -0.103622044471123109,
        0.00166007664274403694 * DAYS_PER_YEAR,
        0.00769901118419740425 * DAYS_PER_YEAR,
        -0.0000690460016972063023 * DAYS_PER_YEAR,
        0.000954791938424326609 * SOLAR_MASS
    );

    var saturn = Body(
        8.34336671824457987,
        4.12479856412430479,
        -0.403523417114321381,
        -0.00276742510726862411 * DAYS_PER_YEAR,
        0.00499852801234917238 * DAYS_PER_YEAR,
        0.0000230417297573763929 * DAYS_PER_YEAR,
        0.000285885980666130812 * SOLAR_MASS
    );

    var uranus = Body(
        12.894369562139131,
        -15.1111514016986312,
        -0.223307578892655734,
        0.00296460137564761618 * DAYS_PER_YEAR,
        0.0023784717395948095 * DAYS_PER_YEAR,
        -0.0000296589568540237556 * DAYS_PER_YEAR,
        0.0000436624404335156298 * SOLAR_MASS
    );

    var neptune = Body(
        15.3796971148509165,
        -25.9193146099879641,
        0.179258772950371181,
        0.00268067772490389322 * DAYS_PER_YEAR,
        0.00162824170038242295 * DAYS_PER_YEAR,
        -0.0000951592254519715870 * DAYS_PER_YEAR,
        0.0000515138902046611451 * SOLAR_MASS
    );

    var bodies = [sun, jupiter, saturn, uranus, neptune];
    var nbodies = 5;

    var px = 0.0, py = 0.0, pz = 0.0;
    for (var i = 0; i < nbodies; i++) {
        var b = bodies[i];
        px += b.vx * b.mass;
        py += b.vy * b.mass;
        pz += b.vz * b.mass;
    }
    sun.vx = -px / SOLAR_MASS;
    sun.vy = -py / SOLAR_MASS;
    sun.vz = -pz / SOLAR_MASS;

    var n = 500000;
    console.log(energy(bodies, nbodies).toFixed(15));
    for (var i = 0; i < n; i++) {
        advance(bodies, nbodies, 0.01);
    }
    console.log(energy(bodies, nbodies).toFixed(15));
}

main();
