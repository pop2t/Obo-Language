// OBO Benchmark: Database Heavy -- 500 employees, 20 query iterations
// Tests: closures, higher-order functions, maps, lists, sorting, aggregation

using System;
using System.Collections.Generic;

static Table BuildTable(int n)
{
    string[] departments = {"Engineering", "Marketing", "HR", "Finance", "Sales", "Support", "Legal", "R&D"};
    string[] levels = {"Junior", "Mid", "Senior", "Lead", "Principal"};

    var t = Table.Create("employees", new List<string>{"name", "department", "salary", "age", "level"});
    for (int i = 0; i < n; i++)
    {
        t.Insert(new Dictionary<string, object> {
            ["name"] = "emp_" + i,
            ["department"] = departments[i % 8],
            ["salary"] = 40000 + (i * 37 + 17) % 80000,
            ["age"] = 22 + i % 30,
            ["level"] = levels[i % 5]
        });
    }
    return t;
}

static long RunQueries(Table t)
{
    long checksum = 0;

    var high = t.Where(r => (int)r.Data["salary"] > 80000);
    checksum += high.Rows.Count;

    var eng = t.Where(r => (string)r.Data["department"] == "Engineering");
    checksum += eng.Rows.Count;

    var sorted = t.OrderBy("salary", true);
    checksum += sorted.Rows.Count - t.Rows.Count;
    checksum += Helpers.MaxOf(t.Rows, "salary");

    var engSorted = eng.OrderBy("salary", true);
    checksum += engSorted.Rows.Count;

    checksum += Helpers.SumOf(t.Rows, "salary");
    checksum += Helpers.AvgOf(t.Rows, "salary");
    checksum += Helpers.MinOf(t.Rows, "salary");
    checksum += Helpers.MaxOf(t.Rows, "salary");

    var (groups, keys) = Helpers.GroupBy(t.Rows, "department");
    foreach (var dept in keys)
        checksum += groups[dept].Count;

    var found = t.FindFirst(r => (string)r.Data["name"] == "emp_42");
    if (found != null)
        checksum += (int)found.Data["salary"];

    long avg = Helpers.AvgOf(t.Rows, "salary");
    var above = t.Where(r => (int)r.Data["salary"] > avg);
    checksum += above.Rows.Count;

    return checksum;
}

int n = 500;
int iterations = 20;

Console.WriteLine("Building table with " + n + " rows...");
var tbl = BuildTable(n);
Console.WriteLine("Running " + iterations + " query iterations...");

long totalChecksum = 0;
for (int iter = 0; iter < iterations; iter++)
{
    var t2 = BuildTable(n);
    long checksum = RunQueries(t2);

    t2.UpdateWhere(
        r => (string)r.Data["department"] == "Engineering",
        d => { d["salary"] = (int)d["salary"] + (int)d["salary"] / 10; return d; }
    );
    checksum += Helpers.SumOf(t2.Rows, "salary");

    int removed = t2.DeleteWhere(r => (int)r.Data["age"] < 25);
    checksum += removed;
    checksum += t2.Rows.Count;

    totalChecksum += checksum;
}

Console.WriteLine("Total checksum: " + totalChecksum);
Console.WriteLine("Database heavy complete.");

class Row
{
    public int Id;
    public Dictionary<string, object> Data;
    public Row(int id, Dictionary<string, object> data) { Id = id; Data = data; }
}

static class Helpers
{
    public static List<Row> SortRows(List<Row> rows, string column, bool ascending)
    {
        var result = new List<Row>();
        var remaining = new List<Row>(rows);
        while (remaining.Count > 0)
        {
            int best = 0;
            for (int i = 1; i < remaining.Count; i++)
            {
                int a = (int)remaining[i].Data[column];
                int b = (int)remaining[best].Data[column];
                if (ascending && a < b) best = i;
                if (!ascending && a > b) best = i;
            }
            result.Add(remaining[best]);
            remaining.RemoveAt(best);
        }
        return result;
    }

    public static long SumOf(List<Row> rows, string column)
    {
        long total = 0;
        foreach (var row in rows) total += (int)row.Data[column];
        return total;
    }

    public static long AvgOf(List<Row> rows, string column)
    {
        if (rows.Count == 0) return 0;
        return SumOf(rows, column) / rows.Count;
    }

    public static int MinOf(List<Row> rows, string column)
    {
        int best = (int)rows[0].Data[column];
        foreach (var row in rows)
        {
            int v = (int)row.Data[column];
            if (v < best) best = v;
        }
        return best;
    }

    public static int MaxOf(List<Row> rows, string column)
    {
        int best = (int)rows[0].Data[column];
        foreach (var row in rows)
        {
            int v = (int)row.Data[column];
            if (v > best) best = v;
        }
        return best;
    }

    public static (Dictionary<string, List<Row>>, List<string>) GroupBy(List<Row> rows, string column)
    {
        var groups = new Dictionary<string, List<Row>>();
        var keys = new List<string>();
        foreach (var row in rows)
        {
            string key = row.Data[column].ToString()!;
            if (groups.ContainsKey(key))
                groups[key].Add(row);
            else
            {
                groups[key] = new List<Row> { row };
                keys.Add(key);
            }
        }
        return (groups, keys);
    }
}

class Table
{
    public string Name;
    public List<string> Columns;
    public List<Row> Rows;
    int _nextId;

    Table(string name, List<string> columns)
    {
        Name = name; Columns = columns; Rows = new List<Row>(); _nextId = 1;
    }

    public static Table Create(string tname, List<string> cols)
        => new Table(tname, new List<string>(cols));

    public int Insert(Dictionary<string, object> record)
    {
        var r = new Row(_nextId, record);
        Rows.Add(r);
        _nextId++;
        return r.Id;
    }

    public Table Where(Func<Row, bool> pred)
    {
        var filtered = new List<Row>();
        foreach (var r in Rows) if (pred(r)) filtered.Add(r);
        var t = Create(Name, Columns);
        t.Rows = filtered;
        return t;
    }

    public Table OrderBy(string column, bool ascending)
    {
        var sorted = Helpers.SortRows(Rows, column, ascending);
        var t = Create(Name, Columns);
        t.Rows = sorted;
        return t;
    }

    public int UpdateWhere(Func<Row, bool> pred, Func<Dictionary<string, object>, Dictionary<string, object>> updater)
    {
        var newRows = new List<Row>();
        int changed = 0;
        foreach (var r in Rows)
        {
            if (pred(r)) { newRows.Add(new Row(r.Id, updater(r.Data))); changed++; }
            else newRows.Add(r);
        }
        Rows = newRows;
        return changed;
    }

    public int DeleteWhere(Func<Row, bool> pred)
    {
        int before = Rows.Count;
        var kept = new List<Row>();
        foreach (var r in Rows) { bool match = pred(r); if (!match) kept.Add(r); }
        Rows = kept;
        return before - Rows.Count;
    }

    public Row FindFirst(Func<Row, bool> pred)
    {
        foreach (var r in Rows) if (pred(r)) return r;
        return null;
    }
}
