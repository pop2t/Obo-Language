"""OBO Benchmark: Map Stress -- Hash map / dictionary heavy workload
Tests: map creation, insertion, lookup, iteration, deletion
This is Python's home turf (dicts are highly optimized in CPython)"""


def main():
    n = 50000

    # Phase 1: Build a large dict
    m = {}
    for i in range(n):
        key = "key_" + str(i)
        m[key] = i * 7 + 3
    print("Phase 1: Built map with " + str(len(m)) + " entries")

    # Phase 2: Lookup every key and accumulate
    s = 0
    for i in range(n):
        key = "key_" + str(i)
        s += m[key]
    print("Phase 2: Sum of all values = " + str(s))

    # Phase 3: Build frequency map from list
    items = []
    for i in range(n):
        items.append(i % 100)

    freq = {}
    for item in items:
        key = str(item)
        if key in freq:
            freq[key] += 1
        else:
            freq[key] = 1
    print("Phase 3: Frequency map has " + str(len(freq)) + " unique keys")

    # Phase 4: Nested map operations
    total = 0
    for rnd in range(200):
        inner = {}
        for j in range(500):
            inner["k" + str(j)] = rnd * 500 + j
        for j in range(500):
            total += inner["k" + str(j)]
    print("Phase 4: Nested map total = " + str(total))

    print("Map stress complete.")


main()
