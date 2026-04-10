import java.util.HashMap;
import java.util.ArrayList;

public class Bench {
    public static void main(String[] args) {
        int n = 50000;

        // Phase 1: Build a large map
        HashMap<String, Long> m = new HashMap<>();
        for (int i = 0; i < n; i++) {
            m.put("key_" + i, (long) i * 7 + 3);
        }
        System.out.printf("Phase 1: Built map with %d entries%n", m.size());

        // Phase 2: Lookup every key and accumulate
        long s = 0;
        for (int i = 0; i < n; i++) {
            s += m.get("key_" + i);
        }
        System.out.printf("Phase 2: Sum of all values = %d%n", s);

        // Phase 3: Build frequency map from list
        int[] items = new int[n];
        for (int i = 0; i < n; i++) {
            items[i] = i % 100;
        }

        HashMap<String, Integer> freq = new HashMap<>();
        for (int item : items) {
            String key = String.valueOf(item);
            freq.merge(key, 1, Integer::sum);
        }
        System.out.printf("Phase 3: Frequency map has %d unique keys%n", freq.size());

        // Phase 4: Nested map operations
        long total = 0;
        for (int rnd = 0; rnd < 200; rnd++) {
            HashMap<String, Long> inner = new HashMap<>();
            for (int j = 0; j < 500; j++) {
                inner.put("k" + j, (long) rnd * 500 + j);
            }
            for (int j = 0; j < 500; j++) {
                total += inner.get("k" + j);
            }
        }
        System.out.printf("Phase 4: Nested map total = %d%n", total);

        System.out.println("Map stress complete.");
    }
}
