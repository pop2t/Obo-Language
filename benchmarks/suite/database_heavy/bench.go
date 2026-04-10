package main

import (
	"fmt"
	"sort"
)

type Value interface{}

type Row struct {
	id   int
	data map[string]Value
}

func getInt(v Value) int64 {
	return v.(int64)
}

func getStr(v Value) string {
	return v.(string)
}

func sortRows(rows []Row, column string, ascending bool) []Row {
	result := make([]Row, len(rows))
	remaining := make([]int, len(rows))
	for i := range remaining {
		remaining[i] = i
	}

	for idx := 0; idx < len(rows); idx++ {
		best := 0
		for i := 1; i < len(remaining); i++ {
			a := getInt(rows[remaining[i]].data[column])
			b := getInt(rows[remaining[best]].data[column])
			if ascending && a < b {
				best = i
			}
			if !ascending && a > b {
				best = i
			}
		}
		result[idx] = rows[remaining[best]]
		remaining = append(remaining[:best], remaining[best+1:]...)
	}
	return result
}

func sumOf(rows []Row, column string) int64 {
	var total int64
	for _, row := range rows {
		total += getInt(row.data[column])
	}
	return total
}

func avgOf(rows []Row, column string) int64 {
	if len(rows) == 0 {
		return 0
	}
	return sumOf(rows, column) / int64(len(rows))
}

func minOf(rows []Row, column string) int64 {
	best := getInt(rows[0].data[column])
	for _, row := range rows {
		v := getInt(row.data[column])
		if v < best {
			best = v
		}
	}
	return best
}

func maxOf(rows []Row, column string) int64 {
	best := getInt(rows[0].data[column])
	for _, row := range rows {
		v := getInt(row.data[column])
		if v > best {
			best = v
		}
	}
	return best
}

type GroupByResult struct {
	groups map[string][]Row
	keys   []string
}

func groupBy(rows []Row, column string) GroupByResult {
	result := GroupByResult{groups: make(map[string][]Row)}
	for _, row := range rows {
		key := fmt.Sprintf("%v", row.data[column])
		if _, ok := result.groups[key]; !ok {
			result.keys = append(result.keys, key)
		}
		result.groups[key] = append(result.groups[key], row)
	}
	return result
}

type Table struct {
	name    string
	columns []string
	rows    []Row
	nextID  int
}

func createTable(name string, cols []string) *Table {
	return &Table{name: name, columns: cols, nextID: 1}
}

func (t *Table) insert(record map[string]Value) int {
	id := t.nextID
	t.rows = append(t.rows, Row{id: id, data: record})
	t.nextID++
	return id
}

func (t *Table) whereFn(pred func(Row) bool) *Table {
	result := createTable(t.name, t.columns)
	for _, r := range t.rows {
		if pred(r) {
			result.rows = append(result.rows, r)
		}
	}
	return result
}

func (t *Table) orderBy(column string, ascending bool) *Table {
	result := createTable(t.name, t.columns)
	result.rows = sortRows(t.rows, column, ascending)
	return result
}

func (t *Table) updateWhere(pred func(Row) bool, updater func(map[string]Value) map[string]Value) int {
	var newRows []Row
	changed := 0
	for _, r := range t.rows {
		if pred(r) {
			newData := updater(r.data)
			newRows = append(newRows, Row{id: r.id, data: newData})
			changed++
		} else {
			newRows = append(newRows, r)
		}
	}
	t.rows = newRows
	return changed
}

func (t *Table) deleteWhere(pred func(Row) bool) int {
	before := len(t.rows)
	var kept []Row
	for _, r := range t.rows {
		if !pred(r) {
			kept = append(kept, r)
		}
	}
	t.rows = kept
	return before - len(t.rows)
}

func (t *Table) findFirst(pred func(Row) bool) *Row {
	for _, r := range t.rows {
		if pred(r) {
			return &r
		}
	}
	return nil
}

var departments = []string{"Engineering", "Marketing", "HR", "Finance", "Sales", "Support", "Legal", "R&D"}
var levels = []string{"Junior", "Mid", "Senior", "Lead", "Principal"}

func buildTable(n int) *Table {
	t := createTable("employees", []string{"name", "department", "salary", "age", "level"})
	for i := 0; i < n; i++ {
		record := map[string]Value{
			"name":       fmt.Sprintf("emp_%d", i),
			"department": departments[i%8],
			"salary":     int64(40000 + (i*37+17)%80000),
			"age":        int64(22 + i%30),
			"level":      levels[i%5],
		}
		t.insert(record)
	}
	return t
}

func runQueries(t *Table) int64 {
	var checksum int64

	high := t.whereFn(func(r Row) bool { return getInt(r.data["salary"]) > 80000 })
	checksum += int64(len(high.rows))

	eng := t.whereFn(func(r Row) bool { return getStr(r.data["department"]) == "Engineering" })
	checksum += int64(len(eng.rows))

	sorted := t.orderBy("salary", true)
	checksum += int64(len(sorted.rows)) - int64(len(t.rows))
	checksum += maxOf(t.rows, "salary")

	engSorted := eng.orderBy("salary", true)
	checksum += int64(len(engSorted.rows))

	checksum += sumOf(t.rows, "salary")
	checksum += avgOf(t.rows, "salary")
	checksum += minOf(t.rows, "salary")
	checksum += maxOf(t.rows, "salary")

	gb := groupBy(t.rows, "department")
	_ = sort.Strings
	for _, dept := range gb.keys {
		checksum += int64(len(gb.groups[dept]))
	}

	found := t.findFirst(func(r Row) bool { return getStr(r.data["name"]) == "emp_42" })
	if found != nil {
		checksum += getInt(found.data["salary"])
	}

	avg := avgOf(t.rows, "salary")
	above := t.whereFn(func(r Row) bool { return getInt(r.data["salary"]) > avg })
	checksum += int64(len(above.rows))

	return checksum
}

func main() {
	n := 500
	iterations := 20

	fmt.Printf("Building table with %d rows...\n", n)
	_ = buildTable(n)
	fmt.Printf("Running %d query iterations...\n", iterations)

	var totalChecksum int64
	for iter := 0; iter < iterations; iter++ {
		t2 := buildTable(n)
		checksum := runQueries(t2)

		t2.updateWhere(
			func(r Row) bool { return getStr(r.data["department"]) == "Engineering" },
			func(d map[string]Value) map[string]Value {
				sal := getInt(d["salary"])
				d["salary"] = sal + sal/10
				return d
			},
		)
		checksum += sumOf(t2.rows, "salary")

		removed := t2.deleteWhere(func(r Row) bool { return getInt(r.data["age"]) < 25 })
		checksum += int64(removed)
		checksum += int64(len(t2.rows))

		totalChecksum += checksum
	}

	fmt.Printf("Total checksum: %d\n", totalChecksum)
	fmt.Println("Database heavy complete.")
}
