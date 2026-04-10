package main

import "fmt"

func main() {
	n := 50000

	// Phase 1: Build a large map
	m := make(map[string]int64)
	for i := 0; i < n; i++ {
		key := fmt.Sprintf("key_%d", i)
		m[key] = int64(i)*7 + 3
	}
	fmt.Printf("Phase 1: Built map with %d entries\n", len(m))

	// Phase 2: Lookup every key and accumulate
	var s int64
	for i := 0; i < n; i++ {
		key := fmt.Sprintf("key_%d", i)
		s += m[key]
	}
	fmt.Printf("Phase 2: Sum of all values = %d\n", s)

	// Phase 3: Build frequency map from list
	items := make([]int, n)
	for i := 0; i < n; i++ {
		items[i] = i % 100
	}

	freq := make(map[string]int)
	for _, item := range items {
		key := fmt.Sprintf("%d", item)
		freq[key]++
	}
	fmt.Printf("Phase 3: Frequency map has %d unique keys\n", len(freq))

	// Phase 4: Nested map operations
	var total int64
	for rnd := 0; rnd < 200; rnd++ {
		inner := make(map[string]int64)
		for j := 0; j < 500; j++ {
			inner[fmt.Sprintf("k%d", j)] = int64(rnd)*500 + int64(j)
		}
		for j := 0; j < 500; j++ {
			total += inner[fmt.Sprintf("k%d", j)]
		}
	}
	fmt.Printf("Phase 4: Nested map total = %d\n", total)

	fmt.Println("Map stress complete.")
}
