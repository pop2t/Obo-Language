using System;

class Bench {
    static void Main() {
        int n = 10000000;
        bool[] sieve = new bool[n];
        Array.Fill(sieve, true);
        sieve[0] = false;
        sieve[1] = false;

        for (int i = 2; i * i < n; i++) {
            if (sieve[i]) {
                for (int j = i * i; j < n; j += i) {
                    sieve[j] = false;
                }
            }
        }

        int total = 0;
        for (int i = 0; i < n; i++) {
            if (sieve[i]) total++;
        }

        Console.WriteLine($"Primes up to {n}: {total}");
    }
}
