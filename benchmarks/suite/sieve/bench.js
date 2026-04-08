function main() {
    const n = 10000000;
    const sieve = new Uint8Array(n).fill(1);
    sieve[0] = 0;
    sieve[1] = 0;

    for (let i = 2; i * i < n; i++) {
        if (sieve[i]) {
            for (let j = i * i; j < n; j += i) {
                sieve[j] = 0;
            }
        }
    }

    let total = 0;
    for (let i = 0; i < n; i++) {
        if (sieve[i]) total++;
    }

    console.log(`Primes up to ${n}: ${total}`);
}

main();
