#include <cstdio>
#include <cstdint>
#include <string>
#include <unordered_map>
#include <vector>

int main() {
    int n = 50000;

    // Phase 1: Build a large map
    std::unordered_map<std::string, int64_t> m;
    for (int i = 0; i < n; i++) {
        std::string key = "key_" + std::to_string(i);
        m[key] = (int64_t)i * 7 + 3;
    }
    printf("Phase 1: Built map with %d entries\n", (int)m.size());

    // Phase 2: Lookup every key and accumulate
    int64_t s = 0;
    for (int i = 0; i < n; i++) {
        std::string key = "key_" + std::to_string(i);
        s += m[key];
    }
    printf("Phase 2: Sum of all values = %lld\n", (long long)s);

    // Phase 3: Build frequency map from list
    std::vector<int> items;
    for (int i = 0; i < n; i++) {
        items.push_back(i % 100);
    }

    std::unordered_map<std::string, int> freq;
    for (int item : items) {
        std::string key = std::to_string(item);
        freq[key]++;
    }
    printf("Phase 3: Frequency map has %d unique keys\n", (int)freq.size());

    // Phase 4: Nested map operations
    int64_t total = 0;
    for (int rnd = 0; rnd < 200; rnd++) {
        std::unordered_map<std::string, int64_t> inner;
        for (int j = 0; j < 500; j++) {
            inner["k" + std::to_string(j)] = (int64_t)rnd * 500 + j;
        }
        for (int j = 0; j < 500; j++) {
            total += inner["k" + std::to_string(j)];
        }
    }
    printf("Phase 4: Nested map total = %lld\n", (long long)total);

    printf("Map stress complete.\n");
    return 0;
}
