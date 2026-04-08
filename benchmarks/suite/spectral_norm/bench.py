import math

def eval_A(i, j):
    return 1.0 / ((i + j) * (i + j + 1) // 2 + i + 1)

def eval_A_times_u(u, n, au):
    for i in range(n):
        s = 0.0
        for j in range(n):
            s += eval_A(i, j) * u[j]
        au[i] = s

def eval_At_times_u(u, n, atu):
    for i in range(n):
        s = 0.0
        for j in range(n):
            s += eval_A(j, i) * u[j]
        atu[i] = s

def eval_AtA_times_u(u, n, atau):
    v = [0.0] * n
    eval_A_times_u(u, n, v)
    eval_At_times_u(v, n, atau)

def main():
    n = 1000
    u = [1.0] * n
    v = [0.0] * n

    for _ in range(10):
        eval_AtA_times_u(u, n, v)
        eval_AtA_times_u(v, n, u)

    vBv = 0.0
    vv = 0.0
    for i in range(n):
        vBv += u[i] * v[i]
        vv += v[i] * v[i]

    print(f"Spectral norm: {math.sqrt(vBv / vv):.9f}")

main()
