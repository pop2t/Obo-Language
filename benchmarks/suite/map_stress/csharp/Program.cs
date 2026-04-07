// OBO Benchmark: Map Stress -- Hash map / dictionary heavy workload
// Tests: map creation, insertion, lookup, iteration, deletion

using System;
using System.Collections.Generic;

int n = 50000;

// Phase 1: Build a large dictionary
var m = new Dictionary<string, int>();
for (int i = 0; i < n; i++)
{
    string key = "key_" + i;
    m[key] = i * 7 + 3;
}
Console.WriteLine("Phase 1: Built map with " + m.Count + " entries");

// Phase 2: Lookup every key and accumulate
long s = 0;
for (int i = 0; i < n; i++)
{
    string key = "key_" + i;
    s += m[key];
}
Console.WriteLine("Phase 2: Sum of all values = " + s);

// Phase 3: Build frequency map from list
var items = new List<int>();
for (int i = 0; i < n; i++)
    items.Add(i % 100);

var freq = new Dictionary<string, int>();
foreach (int item in items)
{
    string key = item.ToString();
    if (freq.ContainsKey(key))
        freq[key]++;
    else
        freq[key] = 1;
}
Console.WriteLine("Phase 3: Frequency map has " + freq.Count + " unique keys");

// Phase 4: Nested map operations
long total = 0;
for (int rnd = 0; rnd < 200; rnd++)
{
    var inner = new Dictionary<string, int>();
    for (int j = 0; j < 500; j++)
        inner["k" + j] = rnd * 500 + j;
    for (int j = 0; j < 500; j++)
        total += inner["k" + j];
}
Console.WriteLine("Phase 4: Nested map total = " + total);

Console.WriteLine("Map stress complete.");
