#include <cstdio>
#include <cstdlib>
#include <cstring>

int main() {
    const int n = 10000000;
    char* sieve = (char*)malloc(n);
    memset(sieve, 1, n);
    sieve[0] = 0;
    sieve[1] = 0;

    for (int i = 2; i * i < n; i++) {
        if (sieve[i]) {
            for (int j = i * i; j < n; j += i) {
                sieve[j] = 0;
            }
        }
    }

    int total = 0;
    for (int i = 0; i < n; i++) {
        if (sieve[i]) total++;
    }

    free(sieve);
    printf("Primes up to %d: %d\n", n, total);
    return 0;
}
