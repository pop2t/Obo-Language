#include <cstdio>
#include <cmath>
#include <vector>

double eval_A(int i, int j) {
    return 1.0 / ((i + j) * (i + j + 1) / 2 + i + 1);
}

void eval_A_times_u(const std::vector<double>& u, int n, std::vector<double>& au) {
    for (int i = 0; i < n; i++) {
        double sum = 0.0;
        for (int j = 0; j < n; j++) {
            sum += eval_A(i, j) * u[j];
        }
        au[i] = sum;
    }
}

void eval_At_times_u(const std::vector<double>& u, int n, std::vector<double>& atu) {
    for (int i = 0; i < n; i++) {
        double sum = 0.0;
        for (int j = 0; j < n; j++) {
            sum += eval_A(j, i) * u[j];
        }
        atu[i] = sum;
    }
}

void eval_AtA_times_u(const std::vector<double>& u, int n, std::vector<double>& atau) {
    std::vector<double> v(n, 0.0);
    eval_A_times_u(u, n, v);
    eval_At_times_u(v, n, atau);
}

int main() {
    int n = 1000;

    std::vector<double> u(n, 1.0);
    std::vector<double> v(n, 0.0);

    for (int i = 0; i < 10; i++) {
        eval_AtA_times_u(u, n, v);
        eval_AtA_times_u(v, n, u);
    }

    double vBv = 0.0, vv = 0.0;
    for (int i = 0; i < n; i++) {
        vBv += u[i] * v[i];
        vv += v[i] * v[i];
    }

    printf("Spectral norm: %.9f\n", sqrt(vBv / vv));
    return 0;
}
