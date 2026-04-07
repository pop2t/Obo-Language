"""OBO Benchmark: Database Heavy -- 500 employees, 20 query iterations
Tests: closures, higher-order functions, maps, lists, sorting, aggregation"""


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
        total += row.data[column]
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
        r = Row(self.next_id, dict(record))
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


def build_table(n):
    departments = ["Engineering", "Marketing", "HR", "Finance", "Sales", "Support", "Legal", "R&D"]
    levels = ["Junior", "Mid", "Senior", "Lead", "Principal"]

    t = Table.create("employees", ["name", "department", "salary", "age", "level"])

    for i in range(n):
        t.insert({
            "name": "emp_" + str(i),
            "department": departments[i % 8],
            "salary": 40000 + (i * 37 + 17) % 80000,
            "age": 22 + i % 30,
            "level": levels[i % 5]
        })

    return t


def run_queries(t):
    checksum = 0

    # WHERE
    high = t.where(lambda r: r.data["salary"] > 80000)
    checksum += len(high.rows)

    eng = t.where(lambda r: r.data["department"] == "Engineering")
    checksum += len(eng.rows)

    # ORDER BY + chained
    sorted_t = t.order_by("salary", True)
    checksum += len(sorted_t.rows) - len(t.rows)
    checksum += max_of(t.rows, "salary")

    eng_sorted = eng.order_by("salary", True)
    checksum += len(eng_sorted.rows)

    # Aggregates
    checksum += sum_of(t.rows, "salary")
    checksum += avg_of(t.rows, "salary")
    checksum += min_of(t.rows, "salary")
    checksum += max_of(t.rows, "salary")

    # GROUP BY
    groups, keys = group_by(t.rows, "department")
    for dept in keys:
        checksum += len(groups[dept])

    # FIND FIRST
    found = t.find_first(lambda r: r.data["name"] == "emp_42")
    if found is not None:
        checksum += found.data["salary"]

    avg = avg_of(t.rows, "salary")
    above = t.where(lambda r: r.data["salary"] > avg)
    checksum += len(above.rows)

    return checksum


def main():
    n = 500
    iterations = 20

    print("Building table with " + str(n) + " rows...")
    t = build_table(n)
    print("Running " + str(iterations) + " query iterations...")

    total_checksum = 0
    for _ in range(iterations):
        t2 = build_table(n)
        checksum = run_queries(t2)

        # UPDATE
        def updater(d):
            d["salary"] = d["salary"] + d["salary"] // 10
            return d
        t2.update_where(
            lambda r: r.data["department"] == "Engineering",
            updater
        )
        checksum += sum_of(t2.rows, "salary")

        # DELETE
        removed = t2.delete_where(lambda r: r.data["age"] < 25)
        checksum += removed
        checksum += len(t2.rows)

        total_checksum += checksum

    print("Total checksum: " + str(total_checksum))
    print("Database heavy complete.")


main()
