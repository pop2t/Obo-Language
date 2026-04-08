use std::collections::HashMap;

fn main() {
    let n = 50000;

    // Phase 1
    let mut m: HashMap<String, i64> = HashMap::new();
    for i in 0..n {
        m.insert(format!("key_{}", i), i as i64 * 7 + 3);
    }
    println!("Phase 1: Built map with {} entries", m.len());

    // Phase 2
    let mut s: i64 = 0;
    for i in 0..n {
        s += m[&format!("key_{}", i)];
    }
    println!("Phase 2: Sum of all values = {}", s);

    // Phase 3
    let mut items = Vec::new();
    for i in 0..n {
        items.push(i % 100);
    }
    let mut freq: HashMap<String, i32> = HashMap::new();
    for &item in &items {
        *freq.entry(item.to_string()).or_insert(0) += 1;
    }
    println!("Phase 3: Frequency map has {} unique keys", freq.len());

    // Phase 4
    let mut total: i64 = 0;
    for rnd in 0..200 {
        let mut inner: HashMap<String, i64> = HashMap::new();
        for j in 0..500 {
            inner.insert(format!("k{}", j), rnd as i64 * 500 + j as i64);
        }
        for j in 0..500 {
            total += inner[&format!("k{}", j)];
        }
    }
    println!("Phase 4: Nested map total = {}", total);

    println!("Map stress complete.");
}
