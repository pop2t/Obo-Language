"""OBO Benchmark: N-Body (Benchmarks Game -- Solar System simulation)
Tests: floating-point arithmetic, object field mutation, math.sqrt"""

import math

class Body:
    __slots__ = ('x', 'y', 'z', 'vx', 'vy', 'vz', 'mass')
    def __init__(self, x, y, z, vx, vy, vz, mass):
        self.x = x; self.y = y; self.z = z
        self.vx = vx; self.vy = vy; self.vz = vz
        self.mass = mass


def advance(bodies, nbodies, dt):
    for i in range(nbodies):
        bi = bodies[i]
        for j in range(i + 1, nbodies):
            bj = bodies[j]
            dx = bi.x - bj.x
            dy = bi.y - bj.y
            dz = bi.z - bj.z
            dist2 = dx * dx + dy * dy + dz * dz
            dist = math.sqrt(dist2)
            mag = dt / (dist2 * dist)

            bi.vx -= dx * bj.mass * mag
            bi.vy -= dy * bj.mass * mag
            bi.vz -= dz * bj.mass * mag
            bj.vx += dx * bi.mass * mag
            bj.vy += dy * bi.mass * mag
            bj.vz += dz * bi.mass * mag

    for i in range(nbodies):
        bi = bodies[i]
        bi.x += dt * bi.vx
        bi.y += dt * bi.vy
        bi.z += dt * bi.vz


def energy(bodies, nbodies):
    e = 0.0
    for i in range(nbodies):
        bi = bodies[i]
        e += 0.5 * bi.mass * (bi.vx * bi.vx + bi.vy * bi.vy + bi.vz * bi.vz)
        for j in range(i + 1, nbodies):
            bj = bodies[j]
            dx = bi.x - bj.x
            dy = bi.y - bj.y
            dz = bi.z - bj.z
            dist = math.sqrt(dx * dx + dy * dy + dz * dz)
            e -= bi.mass * bj.mass / dist
    return e


def main():
    PI = math.pi
    SOLAR_MASS = 4.0 * PI * PI
    DAYS_PER_YEAR = 365.24

    sun = Body(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, SOLAR_MASS)

    jupiter = Body(
        4.84143144246472090,
        -1.16032004402742839,
        -0.103622044471123109,
        0.00166007664274403694 * DAYS_PER_YEAR,
        0.00769901118419740425 * DAYS_PER_YEAR,
        -0.0000690460016972063023 * DAYS_PER_YEAR,
        0.000954791938424326609 * SOLAR_MASS,
    )

    saturn = Body(
        8.34336671824457987,
        4.12479856412430479,
        -0.403523417114321381,
        -0.00276742510726862411 * DAYS_PER_YEAR,
        0.00499852801234917238 * DAYS_PER_YEAR,
        0.0000230417297573763929 * DAYS_PER_YEAR,
        0.000285885980666130812 * SOLAR_MASS,
    )

    uranus = Body(
        12.894369562139131,
        -15.1111514016986312,
        -0.223307578892655734,
        0.00296460137564761618 * DAYS_PER_YEAR,
        0.0023784717395948095 * DAYS_PER_YEAR,
        -0.0000296589568540237556 * DAYS_PER_YEAR,
        0.0000436624404335156298 * SOLAR_MASS,
    )

    neptune = Body(
        15.3796971148509165,
        -25.9193146099879641,
        0.179258772950371181,
        0.00268067772490389322 * DAYS_PER_YEAR,
        0.00162824170038242295 * DAYS_PER_YEAR,
        -0.0000951592254519715870 * DAYS_PER_YEAR,
        0.0000515138902046611451 * SOLAR_MASS,
    )

    bodies = [sun, jupiter, saturn, uranus, neptune]
    nbodies = 5

    px = py = pz = 0.0
    for i in range(nbodies):
        b = bodies[i]
        px += b.vx * b.mass
        py += b.vy * b.mass
        pz += b.vz * b.mass
    sun.vx = -px / SOLAR_MASS
    sun.vy = -py / SOLAR_MASS
    sun.vz = -pz / SOLAR_MASS

    n = 500000
    print(f"{energy(bodies, nbodies):.15f}")
    for _ in range(n):
        advance(bodies, nbodies, 0.01)
    print(f"{energy(bodies, nbodies):.15f}")


main()
