#include <cstdio>
#include <cmath>

static const double PI = 3.14159265358979323846;
static const double SOLAR_MASS = 4.0 * PI * PI;
static const double DAYS_PER_YEAR = 365.24;

struct Body {
    double x, y, z, vx, vy, vz, mass;
};

void advance(Body* bodies, int nbodies, double dt) {
    for (int i = 0; i < nbodies; i++) {
        Body& bi = bodies[i];
        for (int j = i + 1; j < nbodies; j++) {
            Body& bj = bodies[j];
            double dx = bi.x - bj.x;
            double dy = bi.y - bj.y;
            double dz = bi.z - bj.z;
            double dist2 = dx * dx + dy * dy + dz * dz;
            double dist = sqrt(dist2);
            double mag = dt / (dist2 * dist);

            bi.vx -= dx * bj.mass * mag;
            bi.vy -= dy * bj.mass * mag;
            bi.vz -= dz * bj.mass * mag;
            bj.vx += dx * bi.mass * mag;
            bj.vy += dy * bi.mass * mag;
            bj.vz += dz * bi.mass * mag;
        }
    }

    for (int i = 0; i < nbodies; i++) {
        Body& bi = bodies[i];
        bi.x += dt * bi.vx;
        bi.y += dt * bi.vy;
        bi.z += dt * bi.vz;
    }
}

double energy(Body* bodies, int nbodies) {
    double e = 0.0;
    for (int i = 0; i < nbodies; i++) {
        Body& bi = bodies[i];
        e += 0.5 * bi.mass * (bi.vx * bi.vx + bi.vy * bi.vy + bi.vz * bi.vz);
        for (int j = i + 1; j < nbodies; j++) {
            Body& bj = bodies[j];
            double dx = bi.x - bj.x;
            double dy = bi.y - bj.y;
            double dz = bi.z - bj.z;
            double dist = sqrt(dx * dx + dy * dy + dz * dz);
            e -= bi.mass * bj.mass / dist;
        }
    }
    return e;
}

int main() {
    Body bodies[5] = {
        {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, SOLAR_MASS},
        {4.84143144246472090,
         -1.16032004402742839,
         -0.103622044471123109,
         0.00166007664274403694 * DAYS_PER_YEAR,
         0.00769901118419740425 * DAYS_PER_YEAR,
         -0.0000690460016972063023 * DAYS_PER_YEAR,
         0.000954791938424326609 * SOLAR_MASS},
        {8.34336671824457987,
         4.12479856412430479,
         -0.403523417114321381,
         -0.00276742510726862411 * DAYS_PER_YEAR,
         0.00499852801234917238 * DAYS_PER_YEAR,
         0.0000230417297573763929 * DAYS_PER_YEAR,
         0.000285885980666130812 * SOLAR_MASS},
        {12.894369562139131,
         -15.1111514016986312,
         -0.223307578892655734,
         0.00296460137564761618 * DAYS_PER_YEAR,
         0.0023784717395948095 * DAYS_PER_YEAR,
         -0.0000296589568540237556 * DAYS_PER_YEAR,
         0.0000436624404335156298 * SOLAR_MASS},
        {15.3796971148509165,
         -25.9193146099879641,
         0.179258772950371181,
         0.00268067772490389322 * DAYS_PER_YEAR,
         0.00162824170038242295 * DAYS_PER_YEAR,
         -0.0000951592254519715870 * DAYS_PER_YEAR,
         0.0000515138902046611451 * SOLAR_MASS}
    };
    int nbodies = 5;

    double px = 0.0, py = 0.0, pz = 0.0;
    for (int i = 0; i < nbodies; i++) {
        px += bodies[i].vx * bodies[i].mass;
        py += bodies[i].vy * bodies[i].mass;
        pz += bodies[i].vz * bodies[i].mass;
    }
    bodies[0].vx = -px / SOLAR_MASS;
    bodies[0].vy = -py / SOLAR_MASS;
    bodies[0].vz = -pz / SOLAR_MASS;

    int n = 500000;
    printf("%.15f\n", energy(bodies, nbodies));
    for (int i = 0; i < n; i++) {
        advance(bodies, nbodies, 0.01);
    }
    printf("%.15f\n", energy(bodies, nbodies));
    return 0;
}
