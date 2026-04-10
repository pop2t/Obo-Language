package main

import "fmt"

func main() {
	n := 10000000
	sieve := make([]byte, n)
	for i := range sieve {
		sieve[i] = 1
	}
	sieve[0] = 0
	sieve[1] = 0

	for i := 2; i*i < n; i++ {
		if sieve[i] == 1 {
			for j := i * i; j < n; j += i {
				sieve[j] = 0
			}
		}
	}

	total := 0
	for i := 0; i < n; i++ {
		if sieve[i] == 1 {
			total++
		}
	}

	fmt.Printf("Primes up to %d: %d\n", n, total)
}
