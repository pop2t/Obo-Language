#!/usr/bin/env python3
"""OBO Mini Database Engine — Python Benchmark Equivalent"""


class Row:
    __slots__ = ('id', 'data')
    def __init__(self, id, data):
        self.id = id
        self.data = data


def sort_rows(rows, column, ascending):
    result = []
    remaining = list(rows)
    while len(remaining) > 0:
        best = 0
        for i in range(1, len(remaining)):
            a = remaining[i].data[column]
            b = remaining[best].data[column]
            if ascending and a < b:
                best = i
            if not ascending and a > b:
                best = i
        result.append(remaining[best])
        remaining.pop(best)
    return result


def sum_of(rows, column):
    total = 0
    for row in rows:
        total = total + row.data[column]
    return total


def avg_of(rows, column):
    if len(rows) == 0:
        return 0
    return sum_of(rows, column) // len(rows)


def min_of(rows, column):
    if len(rows) == 0:
        return None
    best = rows[0].data[column]
    for row in rows:
        v = row.data[column]
        if v < best:
            best = v
    return best


def max_of(rows, column):
    if len(rows) == 0:
        return None
    best = rows[0].data[column]
    for row in rows:
        v = row.data[column]
        if v > best:
            best = v
    return best


def group_by(rows, column):
    groups = {}
    keys = []
    for row in rows:
        key = str(row.data[column])
        if key in groups:
            groups[key].append(row)
        else:
            groups[key] = [row]
            keys.append(key)
    return groups, keys


def inner_join(t1, t2, col1, col2):
    cols = []
    for c in t1.columns:
        cols.append(t1.name + "." + c)
    for c in t2.columns:
        cols.append(t2.name + "." + c)

    result_rows = []
    rid = 1
    for r1 in t1.rows:
        for r2 in t2.rows:
            if r1.data[col1] == r2.data[col2]:
                merged = {}
                for c in t1.columns:
                    merged[t1.name + "." + c] = r1.data[c]
                for c in t2.columns:
                    merged[t2.name + "." + c] = r2.data[c]
                result_rows.append(Row(rid, merged))
                rid += 1

    joined = Table.create("join", cols)
    joined.rows = result_rows
    return joined


class Table:
    def __init__(self, name, columns):
        self.name = name
        self.columns = columns
        self.rows = []
        self.next_id = 1

    @staticmethod
    def create(tname, cols):
        return Table(tname, list(cols))

    def insert(self, record):
        r = Row(self.next_id, record)
        self.rows.append(r)
        self.next_id += 1
        return r.id

    def where(self, pred):
        filtered = [r for r in self.rows if pred(r)]
        t = Table.create(self.name, self.columns)
        t.rows = filtered
        return t

    def order_by(self, column, ascending):
        sorted_rows = sort_rows(self.rows, column, ascending)
        t = Table.create(self.name, self.columns)
        t.rows = sorted_rows
        return t

    def update_where(self, pred, updater):
        new_rows = []
        changed = 0
        for r in self.rows:
            if pred(r):
                new_data = updater(r.data)
                new_rows.append(Row(r.id, new_data))
                changed += 1
            else:
                new_rows.append(r)
        self.rows = new_rows
        return changed

    def delete_where(self, pred):
        before = len(self.rows)
        kept = []
        for r in self.rows:
            match = pred(r)
            if not match:
                kept.append(r)
        self.rows = kept
        return before - len(self.rows)

    def find_first(self, pred):
        for r in self.rows:
            if pred(r):
                return r
        return None

    def display(self):
        print("")
        print("--- " + self.name + " (" + str(len(self.rows)) + " rows) ---")
        header = "  "
        for c in self.columns:
            header += c.ljust(16)
        print(header)
        print("  " + "-" * (len(self.columns) * 16))
        for r in self.rows:
            line = "  "
            for c in self.columns:
                val = str(r.data[c])
                line += val.ljust(16)
            print(line)


class Database:
    def __init__(self, name):
        self.name = name
        self.tables = {}

    @staticmethod
    def create(dbname):
        return Database(dbname)

    def create_table(self, tname, cols):
        t = Table.create(tname, cols)
        self.tables[tname] = t
        print("[DB] Created table: " + tname + " (" + ", ".join(cols) + ")")
        return t

    def get_table(self, tname):
        return self.tables[tname]

    def update_table(self, tname, t):
        self.tables[tname] = t

    def drop_table(self, tname):
        del self.tables[tname]
        print("[DB] Dropped table: " + tname)

    def info(self):
        print("")
        print("=== Database: " + self.name + " ===")
        for k in self.tables:
            t = self.tables[k]
            print("  " + k + ": " + str(len(t.rows)) + " rows")


def main():
    print("========================================")
    print("  OBO Mini Database Engine \u2014 Benchmark  ")
    print("========================================")

    db = Database.create("CompanyDB")

    employees = db.create_table("employees",
        ["name", "department", "salary", "age", "level"])

    departments = db.create_table("departments",
        ["dept_name", "budget", "head"])

    print("")
    print("== INSERT: Populating employees ==")

    employees.insert({"name": "Alice",   "department": "Engineering", "salary": 95000,  "age": 32, "level": "Senior"})
    employees.insert({"name": "Bob",     "department": "Marketing",   "salary": 72000,  "age": 28, "level": "Mid"})
    employees.insert({"name": "Charlie", "department": "Engineering", "salary": 110000, "age": 35, "level": "Lead"})
    employees.insert({"name": "Diana",   "department": "HR",          "salary": 68000,  "age": 26, "level": "Junior"})
    employees.insert({"name": "Eve",     "department": "Engineering", "salary": 88000,  "age": 30, "level": "Mid"})
    employees.insert({"name": "Frank",   "department": "Marketing",   "salary": 85000,  "age": 34, "level": "Senior"})
    employees.insert({"name": "Grace",   "department": "HR",          "salary": 71000,  "age": 29, "level": "Mid"})
    employees.insert({"name": "Hank",    "department": "Engineering", "salary": 120000, "age": 40, "level": "Principal"})
    employees.insert({"name": "Ivy",     "department": "Marketing",   "salary": 62000,  "age": 24, "level": "Junior"})
    employees.insert({"name": "Jack",    "department": "Finance",     "salary": 92000,  "age": 33, "level": "Senior"})
    employees.insert({"name": "Karen",   "department": "Finance",     "salary": 78000,  "age": 27, "level": "Mid"})
    employees.insert({"name": "Leo",     "department": "Engineering", "salary": 98000,  "age": 31, "level": "Senior"})

    print("Inserted " + str(len(employees.rows)) + " employees")

    departments.insert({"dept_name": "Engineering", "budget": 500000, "head": "Hank"})
    departments.insert({"dept_name": "Marketing",   "budget": 200000, "head": "Frank"})
    departments.insert({"dept_name": "HR",           "budget": 150000, "head": "Grace"})
    departments.insert({"dept_name": "Finance",      "budget": 300000, "head": "Jack"})

    print("Inserted " + str(len(departments.rows)) + " departments")

    # QUERY 1
    print("")
    print("== QUERY 1: SELECT * FROM employees ==")
    employees.display()

    # QUERY 2
    print("")
    print("== QUERY 2: SELECT * WHERE salary > 90000 ==")
    high_earners = employees.where(lambda r: r.data["salary"] > 90000)
    high_earners.display()

    # QUERY 3
    print("")
    print("== QUERY 3: SELECT * WHERE department = 'Engineering' ==")
    eng = employees.where(lambda r: r.data["department"] == "Engineering")
    eng.display()

    # QUERY 4
    print("")
    print("== QUERY 4: SELECT * ORDER BY salary DESC ==")
    by_salary = employees.order_by("salary", False)
    by_salary.display()

    # QUERY 5
    print("")
    print("== QUERY 5: SELECT * ORDER BY age ASC ==")
    by_age = employees.order_by("age", True)
    by_age.display()

    # QUERY 6
    print("")
    print("== QUERY 6: Engineering employees ORDER BY salary DESC ==")
    eng_sorted = employees \
        .where(lambda r: r.data["department"] == "Engineering") \
        .order_by("salary", False)
    eng_sorted.display()

    # QUERY 7
    print("")
    print("== QUERY 7: Aggregate functions on salary ==")
    print("  COUNT:  " + str(len(employees.rows)))
    print("  SUM:    " + str(sum_of(employees.rows, "salary")))
    print("  AVG:    " + str(avg_of(employees.rows, "salary")))
    print("  MIN:    " + str(min_of(employees.rows, "salary")))
    print("  MAX:    " + str(max_of(employees.rows, "salary")))

    # QUERY 8
    print("")
    print("== QUERY 8: GROUP BY department ==")
    groups, keys = group_by(employees.rows, "department")
    for dept in keys:
        dept_rows = groups[dept]
        print("  " + dept.ljust(15)
            + "count=" + str(len(dept_rows)).ljust(4)
            + "avg_salary=" + str(avg_of(dept_rows, "salary")).ljust(10)
            + "min_age=" + str(min_of(dept_rows, "age")).ljust(5)
            + "max_age=" + str(max_of(dept_rows, "age")))

    # QUERY 9
    print("")
    print("== QUERY 9: Find first employee named 'Eve' ==")
    found = employees.find_first(lambda r: r.data["name"] == "Eve")
    if found is not None:
        print("  Found: " + found.data["name"]
            + " | dept=" + found.data["department"]
            + " | salary=$" + str(found.data["salary"]))

    # QUERY 10
    print("")
    print("== QUERY 10: Employees earning above average ==")
    average = avg_of(employees.rows, "salary")
    print("  Average salary: " + str(average))
    above_avg = employees.where(lambda r: r.data["salary"] > average)
    above_avg.display()

    # QUERY 11
    print("")
    print("== QUERY 11: JOIN employees x departments ==")
    joined = inner_join(employees, departments, "department", "dept_name")
    print("  Joined " + str(len(joined.rows)) + " rows")
    for r in joined.rows:
        print("  " + str(r.data["employees.name"]).ljust(10)
            + "dept=" + str(r.data["employees.department"]).ljust(14)
            + "salary=" + str(r.data["employees.salary"]).ljust(10)
            + "budget=" + str(r.data["departments.budget"]).ljust(10)
            + "head=" + str(r.data["departments.head"]))

    # QUERY 12
    print("")
    print("== QUERY 12: UPDATE \u2014 10% raise for Engineering ==")
    def updater(d):
        d["salary"] = d["salary"] + d["salary"] // 10
        return d
    changed = employees.update_where(
        lambda r: r.data["department"] == "Engineering",
        updater
    )
    print("  Updated " + str(changed) + " rows")
    eng_after = employees.where(lambda r: r.data["department"] == "Engineering")
    eng_after.display()

    # QUERY 13
    print("")
    print("== QUERY 13: DELETE \u2014 Remove employees under age 25 ==")
    removed = employees.delete_where(lambda r: r.data["age"] < 25)
    print("  Removed " + str(removed) + " rows")
    employees.display()

    # Final database info
    db.update_table("employees", employees)
    db.update_table("departments", departments)
    db.info()

    print("")
    print("All queries completed successfully!")


main()
