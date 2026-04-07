// OBO Benchmark: N-Body (Benchmarks Game -- Solar System simulation)
// Tests: floating-point arithmetic, struct field mutation, Math.Sqrt

using System;
using System.Globalization;

static void Advance(Body[] bodies, int nbodies, double dt)
{
    for (int i = 0; i < nbodies; i++)
    {
        Body bi = bodies[i];
        for (int j = i + 1; j < nbodies; j++)
        {
            Body bj = bodies[j];
            double dx = bi.X - bj.X;
            double dy = bi.Y - bj.Y;
            double dz = bi.Z - bj.Z;
            double dist2 = dx * dx + dy * dy + dz * dz;
            double dist = Math.Sqrt(dist2);
            double mag = dt / (dist2 * dist);

            bi.Vx -= dx * bj.Mass * mag;
            bi.Vy -= dy * bj.Mass * mag;
            bi.Vz -= dz * bj.Mass * mag;
            bj.Vx += dx * bi.Mass * mag;
            bj.Vy += dy * bi.Mass * mag;
            bj.Vz += dz * bi.Mass * mag;
        }
    }
    for (int i = 0; i < nbodies; i++)
    {
        Body bi = bodies[i];
        bi.X += dt * bi.Vx;
        bi.Y += dt * bi.Vy;
        bi.Z += dt * bi.Vz;
    }
}

static double Energy(Body[] bodies, int nbodies)
{
    double e = 0.0;
    for (int i = 0; i < nbodies; i++)
    {
        Body bi = bodies[i];
        e += 0.5 * bi.Mass * (bi.Vx * bi.Vx + bi.Vy * bi.Vy + bi.Vz * bi.Vz);
        for (int j = i + 1; j < nbodies; j++)
        {
            Body bj = bodies[j];
            double dx = bi.X - bj.X;
            double dy = bi.Y - bj.Y;
            double dz = bi.Z - bj.Z;
            double dist = Math.Sqrt(dx * dx + dy * dy + dz * dz);
            e -= bi.Mass * bj.Mass / dist;
        }
    }
    return e;
}

const double PI = Math.PI;
const double SOLAR_MASS = 4.0 * PI * PI;
const double DAYS_PER_YEAR = 365.24;

var sun = new Body(0, 0, 0, 0, 0, 0, SOLAR_MASS);

var jupiter = new Body(
    4.84143144246472090, -1.16032004402742839, -0.103622044471123109,
    0.00166007664274403694 * DAYS_PER_YEAR, 0.00769901118419740425 * DAYS_PER_YEAR,
    -0.0000690460016972063023 * DAYS_PER_YEAR, 0.000954791938424326609 * SOLAR_MASS);

var saturn = new Body(
    8.34336671824457987, 4.12479856412430479, -0.403523417114321381,
    -0.00276742510726862411 * DAYS_PER_YEAR, 0.00499852801234917238 * DAYS_PER_YEAR,
    0.0000230417297573763929 * DAYS_PER_YEAR, 0.000285885980666130812 * SOLAR_MASS);

var uranus = new Body(
    12.894369562139131, -15.1111514016986312, -0.223307578892655734,
    0.00296460137564761618 * DAYS_PER_YEAR, 0.0023784717395948095 * DAYS_PER_YEAR,
    -0.0000296589568540237556 * DAYS_PER_YEAR, 0.0000436624404335156298 * SOLAR_MASS);

var neptune = new Body(
    15.3796971148509165, -25.9193146099879641, 0.179258772950371181,
    0.00268067772490389322 * DAYS_PER_YEAR, 0.00162824170038242295 * DAYS_PER_YEAR,
    -0.0000951592254519715870 * DAYS_PER_YEAR, 0.0000515138902046611451 * SOLAR_MASS);

Body[] bodies = { sun, jupiter, saturn, uranus, neptune };
int nbodies = 5;

double px = 0, py = 0, pz = 0;
for (int i = 0; i < nbodies; i++)
{
    px += bodies[i].Vx * bodies[i].Mass;
    py += bodies[i].Vy * bodies[i].Mass;
    pz += bodies[i].Vz * bodies[i].Mass;
}
sun.Vx = -px / SOLAR_MASS;
sun.Vy = -py / SOLAR_MASS;
sun.Vz = -pz / SOLAR_MASS;

int n = 500000;
Console.WriteLine(Energy(bodies, nbodies).ToString("F15", CultureInfo.InvariantCulture));
for (int i = 0; i < n; i++)
    Advance(bodies, nbodies, 0.01);
Console.WriteLine(Energy(bodies, nbodies).ToString("F15", CultureInfo.InvariantCulture));

class Body
{
    public double X, Y, Z, Vx, Vy, Vz, Mass;
    public Body(double x, double y, double z, double vx, double vy, double vz, double mass)
    { X = x; Y = y; Z = z; Vx = vx; Vy = vy; Vz = vz; Mass = mass; }
}
