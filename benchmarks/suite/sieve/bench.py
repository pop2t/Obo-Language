def main():
    n = 10000000
    sieve = bytearray(b'\x01' * n)
    sieve[0] = 0
    sieve[1] = 0

    i = 2
    while i * i < n:
        if sieve[i]:
            j = i * i
            while j < n:
                sieve[j] = 0
                j += i
        i += 1

    total = sum(sieve)
    print(f"Primes up to {n}: {total}")

main()
