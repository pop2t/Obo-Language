using System;

class Bench {
    static double EvalA(int i, int j) {
        return 1.0 / ((i + j) * (i + j + 1) / 2 + i + 1);
    }

    static void EvalATimesU(double[] u, int n, double[] au) {
        for (int i = 0; i < n; i++) {
            double sum = 0.0;
            for (int j = 0; j < n; j++) {
                sum += EvalA(i, j) * u[j];
            }
            au[i] = sum;
        }
    }

    static void EvalAtTimesU(double[] u, int n, double[] atu) {
        for (int i = 0; i < n; i++) {
            double sum = 0.0;
            for (int j = 0; j < n; j++) {
                sum += EvalA(j, i) * u[j];
            }
            atu[i] = sum;
        }
    }

    static void EvalAtATimesU(double[] u, int n, double[] atau) {
        double[] v = new double[n];
        EvalATimesU(u, n, v);
        EvalAtTimesU(v, n, atau);
    }

    static void Main() {
        int n = 1000;
        double[] u = new double[n];
        double[] v = new double[n];
        Array.Fill(u, 1.0);

        for (int i = 0; i < 10; i++) {
            EvalAtATimesU(u, n, v);
            EvalAtATimesU(v, n, u);
        }

        double vBv = 0.0, vv = 0.0;
        for (int i = 0; i < n; i++) {
            vBv += u[i] * v[i];
            vv += v[i] * v[i];
        }

        Console.WriteLine($"Spectral norm: {Math.Sqrt(vBv / vv):F9}");
    }
}
