#include <cstdio>
#include <cstdint>
#include <string>
#include <vector>
#include <unordered_map>
#include <variant>
#include <functional>

using Value = std::variant<int64_t, std::string>;
using Data = std::unordered_map<std::string, Value>;

inline int64_t get_int(const Value& v) {
    return std::get<int64_t>(v);
}

inline const std::string& get_str(const Value& v) {
    return std::get<std::string>(v);
}

struct Row {
    int id;
    Data data;
};

std::vector<Row> sort_rows(const std::vector<Row>& rows, const std::string& column, bool ascending) {
    std::vector<Row> result;
    std::vector<int> remaining;
    for (int i = 0; i < (int)rows.size(); i++) remaining.push_back(i);

    while (!remaining.empty()) {
        int best = 0;
        for (int i = 1; i < (int)remaining.size(); i++) {
            int64_t a = get_int(rows[remaining[i]].data.at(column));
            int64_t b = get_int(rows[remaining[best]].data.at(column));
            if (ascending && a < b) best = i;
            if (!ascending && a > b) best = i;
        }
        result.push_back(rows[remaining[best]]);
        remaining.erase(remaining.begin() + best);
    }
    return result;
}

int64_t sum_of(const std::vector<Row>& rows, const std::string& column) {
    int64_t total = 0;
    for (const auto& row : rows) {
        total += get_int(row.data.at(column));
    }
    return total;
}

int64_t avg_of(const std::vector<Row>& rows, const std::string& column) {
    if (rows.empty()) return 0;
    return sum_of(rows, column) / (int64_t)rows.size();
}

int64_t min_of(const std::vector<Row>& rows, const std::string& column) {
    int64_t best = get_int(rows[0].data.at(column));
    for (const auto& row : rows) {
        int64_t v = get_int(row.data.at(column));
        if (v < best) best = v;
    }
    return best;
}

int64_t max_of(const std::vector<Row>& rows, const std::string& column) {
    int64_t best = get_int(rows[0].data.at(column));
    for (const auto& row : rows) {
        int64_t v = get_int(row.data.at(column));
        if (v > best) best = v;
    }
    return best;
}

struct GroupByResult {
    std::unordered_map<std::string, std::vector<Row>> groups;
    std::vector<std::string> keys;
};

GroupByResult group_by(const std::vector<Row>& rows, const std::string& column) {
    GroupByResult result;
    for (const auto& row : rows) {
        std::string key;
        const auto& val = row.data.at(column);
        if (std::holds_alternative<int64_t>(val)) {
            key = std::to_string(std::get<int64_t>(val));
        } else {
            key = std::get<std::string>(val);
        }
        if (result.groups.find(key) == result.groups.end()) {
            result.groups[key] = {};
            result.keys.push_back(key);
        }
        result.groups[key].push_back(row);
    }
    return result;
}

class Table {
public:
    std::string name;
    std::vector<std::string> columns;
    std::vector<Row> rows;
    int next_id;

    Table(const std::string& n, const std::vector<std::string>& cols)
        : name(n), columns(cols), next_id(1) {}

    static Table create(const std::string& tname, const std::vector<std::string>& cols) {
        return Table(tname, cols);
    }

    int insert(const Data& record) {
        int id = next_id;
        rows.push_back({next_id, record});
        next_id++;
        return id;
    }

    Table where_fn(std::function<bool(const Row&)> pred) const {
        Table t = Table::create(name, columns);
        for (const auto& r : rows) {
            if (pred(r)) {
                t.rows.push_back(r);
            }
        }
        return t;
    }

    Table order_by(const std::string& column, bool ascending) const {
        Table t = Table::create(name, columns);
        t.rows = sort_rows(rows, column, ascending);
        return t;
    }

    int update_where(std::function<bool(const Row&)> pred, std::function<Data(Data)> updater) {
        std::vector<Row> new_rows;
        int changed = 0;
        for (const auto& r : rows) {
            if (pred(r)) {
                Data new_data = updater(r.data);
                new_rows.push_back({r.id, std::move(new_data)});
                changed++;
            } else {
                new_rows.push_back(r);
            }
        }
        rows = std::move(new_rows);
        return changed;
    }

    int delete_where(std::function<bool(const Row&)> pred) {
        int before = (int)rows.size();
        std::vector<Row> kept;
        for (const auto& r : rows) {
            if (!pred(r)) {
                kept.push_back(r);
            }
        }
        rows = std::move(kept);
        return before - (int)rows.size();
    }

    const Row* find_first(std::function<bool(const Row&)> pred) const {
        for (const auto& r : rows) {
            if (pred(r)) return &r;
        }
        return nullptr;
    }
};

Table build_table(int n) {
    const char* departments[] = {"Engineering", "Marketing", "HR", "Finance", "Sales", "Support", "Legal", "R&D"};
    const char* levels[] = {"Junior", "Mid", "Senior", "Lead", "Principal"};

    Table t = Table::create("employees", {"name", "department", "salary", "age", "level"});

    for (int i = 0; i < n; i++) {
        Data record;
        record["name"] = std::string("emp_") + std::to_string(i);
        record["department"] = std::string(departments[i % 8]);
        record["salary"] = (int64_t)(40000 + (i * 37 + 17) % 80000);
        record["age"] = (int64_t)(22 + i % 30);
        record["level"] = std::string(levels[i % 5]);
        t.insert(record);
    }

    return t;
}

int64_t run_queries(Table& t) {
    int64_t checksum = 0;

    // WHERE
    Table high = t.where_fn([](const Row& r) { return get_int(r.data.at("salary")) > 80000; });
    checksum += (int64_t)high.rows.size();

    Table eng = t.where_fn([](const Row& r) { return get_str(r.data.at("department")) == "Engineering"; });
    checksum += (int64_t)eng.rows.size();

    // ORDER BY + chained
    Table sorted_t = t.order_by("salary", true);
    checksum += (int64_t)sorted_t.rows.size() - (int64_t)t.rows.size();
    checksum += max_of(t.rows, "salary");

    Table eng_sorted = eng.order_by("salary", true);
    checksum += (int64_t)eng_sorted.rows.size();

    // Aggregates
    checksum += sum_of(t.rows, "salary");
    checksum += avg_of(t.rows, "salary");
    checksum += min_of(t.rows, "salary");
    checksum += max_of(t.rows, "salary");

    // GROUP BY
    GroupByResult gb = group_by(t.rows, "department");
    for (const auto& dept : gb.keys) {
        checksum += (int64_t)gb.groups[dept].size();
    }

    // FIND FIRST
    const Row* found = t.find_first([](const Row& r) { return get_str(r.data.at("name")) == "emp_42"; });
    if (found != nullptr) {
        checksum += get_int(found->data.at("salary"));
    }

    int64_t avg = avg_of(t.rows, "salary");
    Table above = t.where_fn([avg](const Row& r) { return get_int(r.data.at("salary")) > avg; });
    checksum += (int64_t)above.rows.size();

    return checksum;
}

int main() {
    int n = 500;
    int iterations = 20;

    printf("Building table with %d rows...\n", n);
    Table t = build_table(n);
    printf("Running %d query iterations...\n", iterations);

    int64_t total_checksum = 0;
    for (int iter = 0; iter < iterations; iter++) {
        Table t2 = build_table(n);
        int64_t checksum = run_queries(t2);

        // UPDATE
        t2.update_where(
            [](const Row& r) { return get_str(r.data.at("department")) == "Engineering"; },
            [](Data d) -> Data {
                int64_t sal = get_int(d["salary"]);
                d["salary"] = sal + sal / 10;
                return d;
            }
        );
        checksum += sum_of(t2.rows, "salary");

        // DELETE
        int removed = t2.delete_where([](const Row& r) { return get_int(r.data.at("age")) < 25; });
        checksum += (int64_t)removed;
        checksum += (int64_t)t2.rows.size();

        total_checksum += checksum;
    }

    printf("Total checksum: %lld\n", (long long)total_checksum);
    printf("Database heavy complete.\n");
    return 0;
}
