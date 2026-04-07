#include <cstdio>

int fib(int n) {
    if (n < 2) return n;
    return fib(n - 1) + fib(n - 2);
}

int main() {
    int result = fib(35);
    printf("fib(35) = %d\n", result);
    return 0;
}
