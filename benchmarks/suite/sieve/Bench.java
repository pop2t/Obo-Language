public class Bench {
    public static void main(String[] args) {
        int n = 10000000;
        byte[] sieve = new byte[n];
        java.util.Arrays.fill(sieve, (byte) 1);
        sieve[0] = 0;
        sieve[1] = 0;

        for (int i = 2; i * i < n; i++) {
            if (sieve[i] == 1) {
                for (int j = i * i; j < n; j += i) {
                    sieve[j] = 0;
                }
            }
        }

        int total = 0;
        for (int i = 0; i < n; i++) {
            if (sieve[i] == 1) total++;
        }

        System.out.printf("Primes up to %d: %d%n", n, total);
    }
}
