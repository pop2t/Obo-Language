public class Bench {
    static final double PI = 3.14159265358979323846;
    static final double SOLAR_MASS = 4.0 * PI * PI;
    static final double DAYS_PER_YEAR = 365.24;

    static double[] x, y, z, vx, vy, vz, mass;

    static void advance(int nbodies, double dt) {
        for (int i = 0; i < nbodies; i++) {
            for (int j = i + 1; j < nbodies; j++) {
                double dx = x[i] - x[j];
                double dy = y[i] - y[j];
                double dz = z[i] - z[j];
                double dist2 = dx * dx + dy * dy + dz * dz;
                double dist = Math.sqrt(dist2);
                double mag = dt / (dist2 * dist);

                vx[i] -= dx * mass[j] * mag;
                vy[i] -= dy * mass[j] * mag;
                vz[i] -= dz * mass[j] * mag;
                vx[j] += dx * mass[i] * mag;
                vy[j] += dy * mass[i] * mag;
                vz[j] += dz * mass[i] * mag;
            }
        }
        for (int i = 0; i < nbodies; i++) {
            x[i] += dt * vx[i];
            y[i] += dt * vy[i];
            z[i] += dt * vz[i];
        }
    }

    static double energy(int nbodies) {
        double e = 0.0;
        for (int i = 0; i < nbodies; i++) {
            e += 0.5 * mass[i] * (vx[i] * vx[i] + vy[i] * vy[i] + vz[i] * vz[i]);
            for (int j = i + 1; j < nbodies; j++) {
                double dx = x[i] - x[j];
                double dy = y[i] - y[j];
                double dz = z[i] - z[j];
                double dist = Math.sqrt(dx * dx + dy * dy + dz * dz);
                e -= mass[i] * mass[j] / dist;
            }
        }
        return e;
    }

    public static void main(String[] args) {
        int nbodies = 5;
        x = new double[]{0.0, 4.84143144246472090, 8.34336671824457987, 12.894369562139131, 15.3796971148509165};
        y = new double[]{0.0, -1.16032004402742839, 4.12479856412430479, -15.1111514016986312, -25.9193146099879641};
        z = new double[]{0.0, -0.103622044471123109, -0.403523417114321381, -0.223307578892655734, 0.179258772950371181};
        vx = new double[]{0.0, 0.00166007664274403694 * DAYS_PER_YEAR, -0.00276742510726862411 * DAYS_PER_YEAR, 0.00296460137564761618 * DAYS_PER_YEAR, 0.00268067772490389322 * DAYS_PER_YEAR};
        vy = new double[]{0.0, 0.00769901118419740425 * DAYS_PER_YEAR, 0.00499852801234917238 * DAYS_PER_YEAR, 0.0023784717395948095 * DAYS_PER_YEAR, 0.00162824170038242295 * DAYS_PER_YEAR};
        vz = new double[]{0.0, -0.0000690460016972063023 * DAYS_PER_YEAR, 0.0000230417297573763929 * DAYS_PER_YEAR, -0.0000296589568540237556 * DAYS_PER_YEAR, -0.0000951592254519715870 * DAYS_PER_YEAR};
        mass = new double[]{SOLAR_MASS, 0.000954791938424326609 * SOLAR_MASS, 0.000285885980666130812 * SOLAR_MASS, 0.0000436624404335156298 * SOLAR_MASS, 0.0000515138902046611451 * SOLAR_MASS};

        double px = 0.0, py = 0.0, pz = 0.0;
        for (int i = 0; i < nbodies; i++) {
            px += vx[i] * mass[i];
            py += vy[i] * mass[i];
            pz += vz[i] * mass[i];
        }
        vx[0] = -px / SOLAR_MASS;
        vy[0] = -py / SOLAR_MASS;
        vz[0] = -pz / SOLAR_MASS;

        int n = 500000;
        System.out.printf("%.15f%n", energy(nbodies));
        for (int i = 0; i < n; i++) {
            advance(nbodies, 0.01);
        }
        System.out.printf("%.15f%n", energy(nbodies));
    }
}
