function main() {
    var n = 50000;

    // Phase 1: Build a large map
    var m = new Map();
    for (var i = 0; i < n; i++) {
        var key = "key_" + i;
        m.set(key, i * 7 + 3);
    }
    console.log("Phase 1: Built map with " + m.size + " entries");

    // Phase 2: Lookup every key and accumulate
    var s = 0;
    for (var i = 0; i < n; i++) {
        var key = "key_" + i;
        s += m.get(key);
    }
    console.log("Phase 2: Sum of all values = " + s);

    // Phase 3: Build frequency map from list
    var items = [];
    for (var i = 0; i < n; i++) {
        items.push(i % 100);
    }

    var freq = new Map();
    for (var idx = 0; idx < items.length; idx++) {
        var key = "" + items[idx];
        if (freq.has(key)) {
            freq.set(key, freq.get(key) + 1);
        } else {
            freq.set(key, 1);
        }
    }
    console.log("Phase 3: Frequency map has " + freq.size + " unique keys");

    // Phase 4: Nested map operations
    var total = 0;
    for (var rnd = 0; rnd < 200; rnd++) {
        var inner = new Map();
        for (var j = 0; j < 500; j++) {
            inner.set("k" + j, rnd * 500 + j);
        }
        for (var j = 0; j < 500; j++) {
            total += inner.get("k" + j);
        }
    }
    console.log("Phase 4: Nested map total = " + total);

    console.log("Map stress complete.");
}

main();
