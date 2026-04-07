function sortRows(rows, column, ascending) {
    var result = [];
    var remaining = rows.slice();
    while (remaining.length > 0) {
        var best = 0;
        for (var i = 1; i < remaining.length; i++) {
            var a = remaining[i].data[column];
            var b = remaining[best].data[column];
            if (ascending && a < b) best = i;
            if (!ascending && a > b) best = i;
        }
        result.push(remaining[best]);
        remaining.splice(best, 1);
    }
    return result;
}

function sumOf(rows, column) {
    var total = 0;
    for (var i = 0; i < rows.length; i++) {
        total += rows[i].data[column];
    }
    return total;
}

function avgOf(rows, column) {
    if (rows.length === 0) return 0;
    return Math.floor(sumOf(rows, column) / rows.length);
}

function minOf(rows, column) {
    if (rows.length === 0) return null;
    var best = rows[0].data[column];
    for (var i = 0; i < rows.length; i++) {
        var v = rows[i].data[column];
        if (v < best) best = v;
    }
    return best;
}

function maxOf(rows, column) {
    if (rows.length === 0) return null;
    var best = rows[0].data[column];
    for (var i = 0; i < rows.length; i++) {
        var v = rows[i].data[column];
        if (v > best) best = v;
    }
    return best;
}

function groupBy(rows, column) {
    var groups = {};
    var keys = [];
    for (var i = 0; i < rows.length; i++) {
        var key = "" + rows[i].data[column];
        if (key in groups) {
            groups[key].push(rows[i]);
        } else {
            groups[key] = [rows[i]];
            keys.push(key);
        }
    }
    return [groups, keys];
}

function Table(name, columns) {
    this.name = name;
    this.columns = columns.slice();
    this.rows = [];
    this.nextId = 1;
}

Table.create = function(tname, cols) {
    return new Table(tname, cols);
};

Table.prototype.insert = function(record) {
    var data = {};
    for (var k in record) {
        if (record.hasOwnProperty(k)) data[k] = record[k];
    }
    var r = { id: this.nextId, data: data };
    this.rows.push(r);
    this.nextId++;
    return r.id;
};

Table.prototype.where = function(pred) {
    var filtered = [];
    for (var i = 0; i < this.rows.length; i++) {
        if (pred(this.rows[i])) filtered.push(this.rows[i]);
    }
    var t = Table.create(this.name, this.columns);
    t.rows = filtered;
    return t;
};

Table.prototype.orderBy = function(column, ascending) {
    var sorted = sortRows(this.rows, column, ascending);
    var t = Table.create(this.name, this.columns);
    t.rows = sorted;
    return t;
};

Table.prototype.updateWhere = function(pred, updater) {
    var newRows = [];
    var changed = 0;
    for (var i = 0; i < this.rows.length; i++) {
        var r = this.rows[i];
        if (pred(r)) {
            var newData = updater(r.data);
            newRows.push({ id: r.id, data: newData });
            changed++;
        } else {
            newRows.push(r);
        }
    }
    this.rows = newRows;
    return changed;
};

Table.prototype.deleteWhere = function(pred) {
    var before = this.rows.length;
    var kept = [];
    for (var i = 0; i < this.rows.length; i++) {
        if (!pred(this.rows[i])) {
            kept.push(this.rows[i]);
        }
    }
    this.rows = kept;
    return before - this.rows.length;
};

Table.prototype.findFirst = function(pred) {
    for (var i = 0; i < this.rows.length; i++) {
        if (pred(this.rows[i])) return this.rows[i];
    }
    return null;
};

function buildTable(n) {
    var departments = ["Engineering", "Marketing", "HR", "Finance", "Sales", "Support", "Legal", "R&D"];
    var levels = ["Junior", "Mid", "Senior", "Lead", "Principal"];

    var t = Table.create("employees", ["name", "department", "salary", "age", "level"]);

    for (var i = 0; i < n; i++) {
        t.insert({
            name: "emp_" + i,
            department: departments[i % 8],
            salary: 40000 + (i * 37 + 17) % 80000,
            age: 22 + i % 30,
            level: levels[i % 5]
        });
    }

    return t;
}

function runQueries(t) {
    var checksum = 0;

    // WHERE
    var high = t.where(function(r) { return r.data.salary > 80000; });
    checksum += high.rows.length;

    var eng = t.where(function(r) { return r.data.department === "Engineering"; });
    checksum += eng.rows.length;

    // ORDER BY + chained
    var sortedT = t.orderBy("salary", true);
    checksum += sortedT.rows.length - t.rows.length;
    checksum += maxOf(t.rows, "salary");

    var engSorted = eng.orderBy("salary", true);
    checksum += engSorted.rows.length;

    // Aggregates
    checksum += sumOf(t.rows, "salary");
    checksum += avgOf(t.rows, "salary");
    checksum += minOf(t.rows, "salary");
    checksum += maxOf(t.rows, "salary");

    // GROUP BY
    var result = groupBy(t.rows, "department");
    var groups = result[0];
    var keys = result[1];
    for (var i = 0; i < keys.length; i++) {
        checksum += groups[keys[i]].length;
    }

    // FIND FIRST
    var found = t.findFirst(function(r) { return r.data.name === "emp_42"; });
    if (found !== null) {
        checksum += found.data.salary;
    }

    var avg = avgOf(t.rows, "salary");
    var above = t.where(function(r) { return r.data.salary > avg; });
    checksum += above.rows.length;

    return checksum;
}

function main() {
    var n = 500;
    var iterations = 20;

    console.log("Building table with " + n + " rows...");
    var t = buildTable(n);
    console.log("Running " + iterations + " query iterations...");

    var totalChecksum = 0;
    for (var iter = 0; iter < iterations; iter++) {
        var t2 = buildTable(n);
        var checksum = runQueries(t2);

        // UPDATE
        t2.updateWhere(
            function(r) { return r.data.department === "Engineering"; },
            function(d) {
                d.salary = d.salary + Math.floor(d.salary / 10);
                return d;
            }
        );
        checksum += sumOf(t2.rows, "salary");

        // DELETE
        var removed = t2.deleteWhere(function(r) { return r.data.age < 25; });
        checksum += removed;
        checksum += t2.rows.length;

        totalChecksum += checksum;
    }

    console.log("Total checksum: " + totalChecksum);
    console.log("Database heavy complete.");
}

main();
