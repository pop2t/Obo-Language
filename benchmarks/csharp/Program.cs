using System;
using System.Collections.Generic;

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

    public static int SumOf(List<Row> rows, string column)
    {
        int total = 0;
        foreach (var row in rows) total += (int)row.Data[column];
        return total;
    }

    public static int AvgOf(List<Row> rows, string column)
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

    public static Table InnerJoin(Table t1, Table t2, string col1, string col2)
    {
        var cols = new List<string>();
        foreach (var c in t1.Columns) cols.Add(t1.Name + "." + c);
        foreach (var c in t2.Columns) cols.Add(t2.Name + "." + c);

        var resultRows = new List<Row>();
        int rid = 1;
        foreach (var r1 in t1.Rows)
        {
            foreach (var r2 in t2.Rows)
            {
                if (r1.Data[col1].Equals(r2.Data[col2]))
                {
                    var merged = new Dictionary<string, object>();
                    foreach (var c in t1.Columns) merged[t1.Name + "." + c] = r1.Data[c];
                    foreach (var c in t2.Columns) merged[t2.Name + "." + c] = r2.Data[c];
                    resultRows.Add(new Row(rid, merged));
                    rid++;
                }
            }
        }

        var joined = Table.Create("join", cols);
        joined.Rows = resultRows;
        return joined;
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
        Name = name;
        Columns = columns;
        Rows = new List<Row>();
        _nextId = 1;
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
        foreach (var r in Rows)
            if (pred(r)) filtered.Add(r);
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
            if (pred(r))
            {
                var newData = updater(r.Data);
                newRows.Add(new Row(r.Id, newData));
                changed++;
            }
            else
                newRows.Add(r);
        }
        Rows = newRows;
        return changed;
    }

    public int DeleteWhere(Func<Row, bool> pred)
    {
        int before = Rows.Count;
        var kept = new List<Row>();
        foreach (var r in Rows)
        {
            bool match = pred(r);
            if (!match) kept.Add(r);
        }
        Rows = kept;
        return before - Rows.Count;
    }

    public Row? FindFirst(Func<Row, bool> pred)
    {
        foreach (var r in Rows)
            if (pred(r)) return r;
        return null;
    }

    public void Display()
    {
        Console.WriteLine("");
        Console.WriteLine("--- " + Name + " (" + Rows.Count + " rows) ---");
        string header = "  ";
        foreach (var c in Columns) header += c.PadRight(16);
        Console.WriteLine(header);
        Console.WriteLine("  " + new string('-', Columns.Count * 16));
        foreach (var r in Rows)
        {
            string line = "  ";
            foreach (var c in Columns)
            {
                string val = r.Data[c].ToString()!;
                line += val.PadRight(16);
            }
            Console.WriteLine(line);
        }
    }
}

class Database
{
    public string Name;
    public Dictionary<string, Table> Tables;

    Database(string name)
    {
        Name = name;
        Tables = new Dictionary<string, Table>();
    }

    public static Database Create(string dbname) => new Database(dbname);

    public Table CreateTable(string tname, List<string> cols)
    {
        var t = Table.Create(tname, cols);
        Tables[tname] = t;
        Console.WriteLine("[DB] Created table: " + tname + " (" + string.Join(", ", cols) + ")");
        return t;
    }

    public void UpdateTable(string tname, Table t) => Tables[tname] = t;

    public void Info()
    {
        Console.WriteLine("");
        Console.WriteLine("=== Database: " + Name + " ===");
        foreach (var k in Tables.Keys)
        {
            var t = Tables[k];
            Console.WriteLine("  " + k + ": " + t.Rows.Count + " rows");
        }
    }
}

class Program
{
    static void Main()
    {
        Console.WriteLine("========================================");
        Console.WriteLine("  OBO Mini Database Engine \u2014 Benchmark  ");
        Console.WriteLine("========================================");

        var db = Database.Create("CompanyDB");

        var employees = db.CreateTable("employees",
            new List<string> { "name", "department", "salary", "age", "level" });

        var departments = db.CreateTable("departments",
            new List<string> { "dept_name", "budget", "head" });

        Console.WriteLine("");
        Console.WriteLine("== INSERT: Populating employees ==");

        employees.Insert(new Dictionary<string, object> { ["name"]="Alice",   ["department"]="Engineering", ["salary"]=95000,  ["age"]=32, ["level"]="Senior" });
        employees.Insert(new Dictionary<string, object> { ["name"]="Bob",     ["department"]="Marketing",   ["salary"]=72000,  ["age"]=28, ["level"]="Mid" });
        employees.Insert(new Dictionary<string, object> { ["name"]="Charlie", ["department"]="Engineering", ["salary"]=110000, ["age"]=35, ["level"]="Lead" });
        employees.Insert(new Dictionary<string, object> { ["name"]="Diana",   ["department"]="HR",          ["salary"]=68000,  ["age"]=26, ["level"]="Junior" });
        employees.Insert(new Dictionary<string, object> { ["name"]="Eve",     ["department"]="Engineering", ["salary"]=88000,  ["age"]=30, ["level"]="Mid" });
        employees.Insert(new Dictionary<string, object> { ["name"]="Frank",   ["department"]="Marketing",   ["salary"]=85000,  ["age"]=34, ["level"]="Senior" });
        employees.Insert(new Dictionary<string, object> { ["name"]="Grace",   ["department"]="HR",          ["salary"]=71000,  ["age"]=29, ["level"]="Mid" });
        employees.Insert(new Dictionary<string, object> { ["name"]="Hank",    ["department"]="Engineering", ["salary"]=120000, ["age"]=40, ["level"]="Principal" });
        employees.Insert(new Dictionary<string, object> { ["name"]="Ivy",     ["department"]="Marketing",   ["salary"]=62000,  ["age"]=24, ["level"]="Junior" });
        employees.Insert(new Dictionary<string, object> { ["name"]="Jack",    ["department"]="Finance",     ["salary"]=92000,  ["age"]=33, ["level"]="Senior" });
        employees.Insert(new Dictionary<string, object> { ["name"]="Karen",   ["department"]="Finance",     ["salary"]=78000,  ["age"]=27, ["level"]="Mid" });
        employees.Insert(new Dictionary<string, object> { ["name"]="Leo",     ["department"]="Engineering", ["salary"]=98000,  ["age"]=31, ["level"]="Senior" });

        Console.WriteLine("Inserted " + employees.Rows.Count + " employees");

        departments.Insert(new Dictionary<string, object> { ["dept_name"]="Engineering", ["budget"]=500000, ["head"]="Hank" });
        departments.Insert(new Dictionary<string, object> { ["dept_name"]="Marketing",   ["budget"]=200000, ["head"]="Frank" });
        departments.Insert(new Dictionary<string, object> { ["dept_name"]="HR",           ["budget"]=150000, ["head"]="Grace" });
        departments.Insert(new Dictionary<string, object> { ["dept_name"]="Finance",      ["budget"]=300000, ["head"]="Jack" });

        Console.WriteLine("Inserted " + departments.Rows.Count + " departments");

        // QUERY 1
        Console.WriteLine("");
        Console.WriteLine("== QUERY 1: SELECT * FROM employees ==");
        employees.Display();

        // QUERY 2
        Console.WriteLine("");
        Console.WriteLine("== QUERY 2: SELECT * WHERE salary > 90000 ==");
        var highEarners = employees.Where(r => (int)r.Data["salary"] > 90000);
        highEarners.Display();

        // QUERY 3
        Console.WriteLine("");
        Console.WriteLine("== QUERY 3: SELECT * WHERE department = 'Engineering' ==");
        var eng = employees.Where(r => (string)r.Data["department"] == "Engineering");
        eng.Display();

        // QUERY 4
        Console.WriteLine("");
        Console.WriteLine("== QUERY 4: SELECT * ORDER BY salary DESC ==");
        var bySalary = employees.OrderBy("salary", false);
        bySalary.Display();

        // QUERY 5
        Console.WriteLine("");
        Console.WriteLine("== QUERY 5: SELECT * ORDER BY age ASC ==");
        var byAge = employees.OrderBy("age", true);
        byAge.Display();

        // QUERY 6
        Console.WriteLine("");
        Console.WriteLine("== QUERY 6: Engineering employees ORDER BY salary DESC ==");
        var engSorted = employees
            .Where(r => (string)r.Data["department"] == "Engineering")
            .OrderBy("salary", false);
        engSorted.Display();

        // QUERY 7
        Console.WriteLine("");
        Console.WriteLine("== QUERY 7: Aggregate functions on salary ==");
        Console.WriteLine("  COUNT:  " + employees.Rows.Count);
        Console.WriteLine("  SUM:    " + Helpers.SumOf(employees.Rows, "salary"));
        Console.WriteLine("  AVG:    " + Helpers.AvgOf(employees.Rows, "salary"));
        Console.WriteLine("  MIN:    " + Helpers.MinOf(employees.Rows, "salary"));
        Console.WriteLine("  MAX:    " + Helpers.MaxOf(employees.Rows, "salary"));

        // QUERY 8
        Console.WriteLine("");
        Console.WriteLine("== QUERY 8: GROUP BY department ==");
        var (groups, keys) = Helpers.GroupBy(employees.Rows, "department");
        foreach (var dept in keys)
        {
            var deptRows = groups[dept];
            Console.WriteLine("  " + dept.PadRight(15)
                + "count=" + deptRows.Count.ToString().PadRight(4)
                + "avg_salary=" + Helpers.AvgOf(deptRows, "salary").ToString().PadRight(10)
                + "min_age=" + Helpers.MinOf(deptRows, "age").ToString().PadRight(5)
                + "max_age=" + Helpers.MaxOf(deptRows, "age"));
        }

        // QUERY 9
        Console.WriteLine("");
        Console.WriteLine("== QUERY 9: Find first employee named 'Eve' ==");
        var found = employees.FindFirst(r => (string)r.Data["name"] == "Eve");
        if (found != null)
        {
            Console.WriteLine("  Found: " + found.Data["name"]
                + " | dept=" + found.Data["department"]
                + " | salary=$" + found.Data["salary"]);
        }

        // QUERY 10
        Console.WriteLine("");
        Console.WriteLine("== QUERY 10: Employees earning above average ==");
        int average = Helpers.AvgOf(employees.Rows, "salary");
        Console.WriteLine("  Average salary: " + average);
        var aboveAvg = employees.Where(r => (int)r.Data["salary"] > average);
        aboveAvg.Display();

        // QUERY 11
        Console.WriteLine("");
        Console.WriteLine("== QUERY 11: JOIN employees x departments ==");
        var joined = Helpers.InnerJoin(employees, departments, "department", "dept_name");
        Console.WriteLine("  Joined " + joined.Rows.Count + " rows");
        foreach (var r in joined.Rows)
        {
            Console.WriteLine("  " + r.Data["employees.name"].ToString()!.PadRight(10)
                + "dept=" + r.Data["employees.department"].ToString()!.PadRight(14)
                + "salary=" + r.Data["employees.salary"].ToString()!.PadRight(10)
                + "budget=" + r.Data["departments.budget"].ToString()!.PadRight(10)
                + "head=" + r.Data["departments.head"]);
        }

        // QUERY 12
        Console.WriteLine("");
        Console.WriteLine("== QUERY 12: UPDATE \u2014 10% raise for Engineering ==");
        int changed = employees.UpdateWhere(
            r => (string)r.Data["department"] == "Engineering",
            d => { d["salary"] = (int)d["salary"] + (int)d["salary"] / 10; return d; }
        );
        Console.WriteLine("  Updated " + changed + " rows");
        var engAfter = employees.Where(r => (string)r.Data["department"] == "Engineering");
        engAfter.Display();

        // QUERY 13
        Console.WriteLine("");
        Console.WriteLine("== QUERY 13: DELETE \u2014 Remove employees under age 25 ==");
        int removed = employees.DeleteWhere(r => (int)r.Data["age"] < 25);
        Console.WriteLine("  Removed " + removed + " rows");
        employees.Display();

        // Final database info
        db.UpdateTable("employees", employees);
        db.UpdateTable("departments", departments);
        db.Info();

        Console.WriteLine("");
        Console.WriteLine("All queries completed successfully!");
    }
}
