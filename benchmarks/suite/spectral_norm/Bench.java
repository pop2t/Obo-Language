public class Bench {
    static double evalA(int i, int j) {
        return 1.0 / ((i + j) * (i + j + 1) / 2 + i + 1);
    }

    static void evalATimesU(double[] u, int n, double[] au) {
        for (int i = 0; i < n; i++) {
            double sum = 0.0;
            for (int j = 0; j < n; j++) {
                sum += evalA(i, j) * u[j];
            }
            au[i] = sum;
        }
    }

    static void evalAtTimesU(double[] u, int n, double[] atu) {
        for (int i = 0; i < n; i++) {
            double sum = 0.0;
            for (int j = 0; j < n; j++) {
                sum += evalA(j, i) * u[j];
            }
            atu[i] = sum;
        }
    }

    static void evalAtATimesU(double[] u, int n, double[] atau) {
        double[] v = new double[n];
        evalATimesU(u, n, v);
        evalAtTimesU(v, n, atau);
    }

    public static void main(String[] args) {
        int n = 1000;

        double[] u = new double[n];
        double[] v = new double[n];
        java.util.Arrays.fill(u, 1.0);

        for (int i = 0; i < 10; i++) {
            evalAtATimesU(u, n, v);
            evalAtATimesU(v, n, u);
        }

        double vBv = 0.0, vv = 0.0;
        for (int i = 0; i < n; i++) {
            vBv += u[i] * v[i];
            vv += v[i] * v[i];
        }

        System.out.printf("Spectral norm: %.9f%n", Math.sqrt(vBv / vv));
    }
}
