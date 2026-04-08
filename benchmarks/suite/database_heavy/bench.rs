use std::collections::HashMap;

#[derive(Clone)]
enum Value {
    Int(i64),
    Str(String),
}

fn get_int(v: &Value) -> i64 { match v { Value::Int(i) => *i, _ => panic!() } }
fn get_str(v: &Value) -> &str { match v { Value::Str(s) => s, _ => panic!() } }

type Data = HashMap<String, Value>;

#[derive(Clone)]
struct Row { id: i32, data: Data }

fn sort_rows(rows: &[Row], column: &str, ascending: bool) -> Vec<Row> {
    let mut result: Vec<Row> = Vec::new();
    let mut remaining: Vec<usize> = (0..rows.len()).collect();
    while !remaining.is_empty() {
        let mut best = 0;
        for i in 1..remaining.len() {
            let a = get_int(&rows[remaining[i]].data[column]);
            let b = get_int(&rows[remaining[best]].data[column]);
            if (ascending && a < b) || (!ascending && a > b) { best = i; }
        }
        result.push(rows[remaining[best]].clone());
        remaining.remove(best);
    }
    result
}

fn sum_of(rows: &[Row], column: &str) -> i64 { rows.iter().map(|r| get_int(&r.data[column])).sum() }
fn avg_of(rows: &[Row], column: &str) -> i64 { if rows.is_empty() { 0 } else { sum_of(rows, column) / rows.len() as i64 } }
fn min_of(rows: &[Row], column: &str) -> i64 { rows.iter().map(|r| get_int(&r.data[column])).min().unwrap() }
fn max_of(rows: &[Row], column: &str) -> i64 { rows.iter().map(|r| get_int(&r.data[column])).max().unwrap() }

struct GroupByResult { groups: HashMap<String, Vec<Row>>, keys: Vec<String> }

fn group_by(rows: &[Row], column: &str) -> GroupByResult {
    let mut groups: HashMap<String, Vec<Row>> = HashMap::new();
    let mut keys = Vec::new();
    for r in rows {
        let key = match &r.data[column] { Value::Int(i) => i.to_string(), Value::Str(s) => s.clone() };
        if !groups.contains_key(&key) { keys.push(key.clone()); }
        groups.entry(key).or_default().push(r.clone());
    }
    GroupByResult { groups, keys }
}

struct Table { name: String, columns: Vec<String>, rows: Vec<Row>, next_id: i32 }

impl Table {
    fn create(name: &str, cols: &[&str]) -> Self {
        Table { name: name.to_string(), columns: cols.iter().map(|s| s.to_string()).collect(), rows: Vec::new(), next_id: 1 }
    }
    fn insert(&mut self, record: Data) -> i32 {
        let id = self.next_id;
        self.rows.push(Row { id, data: record });
        self.next_id += 1;
        id
    }
    fn where_fn(&self, pred: impl Fn(&Row) -> bool) -> Table {
        let mut t = Table::create(&self.name, &self.columns.iter().map(|s| s.as_str()).collect::<Vec<_>>());
        t.rows = self.rows.iter().filter(|r| pred(r)).cloned().collect();
        t
    }
    fn order_by(&self, column: &str, ascending: bool) -> Table {
        let mut t = Table::create(&self.name, &self.columns.iter().map(|s| s.as_str()).collect::<Vec<_>>());
        t.rows = sort_rows(&self.rows, column, ascending);
        t
    }
    fn update_where(&mut self, pred: impl Fn(&Row) -> bool, updater: impl Fn(Data) -> Data) -> i32 {
        let mut changed = 0;
        self.rows = self.rows.drain(..).map(|r| {
            if pred(&r) { changed += 1; Row { id: r.id, data: updater(r.data) } } else { r }
        }).collect();
        changed
    }
    fn delete_where(&mut self, pred: impl Fn(&Row) -> bool) -> i32 {
        let before = self.rows.len();
        self.rows.retain(|r| !pred(r));
        (before - self.rows.len()) as i32
    }
    fn find_first(&self, pred: impl Fn(&Row) -> bool) -> Option<&Row> {
        self.rows.iter().find(|r| pred(r))
    }
}

fn build_table(n: i32) -> Table {
    let departments = ["Engineering", "Marketing", "HR", "Finance", "Sales", "Support", "Legal", "R&D"];
    let levels = ["Junior", "Mid", "Senior", "Lead", "Principal"];
    let mut t = Table::create("employees", &["name", "department", "salary", "age", "level"]);
    for i in 0..n {
        let mut record = Data::new();
        record.insert("name".into(), Value::Str(format!("emp_{}", i)));
        record.insert("department".into(), Value::Str(departments[(i % 8) as usize].into()));
        record.insert("salary".into(), Value::Int(40000 + (i as i64 * 37 + 17) % 80000));
        record.insert("age".into(), Value::Int(22 + (i % 30) as i64));
        record.insert("level".into(), Value::Str(levels[(i % 5) as usize].into()));
        t.insert(record);
    }
    t
}

fn run_queries(t: &mut Table) -> i64 {
    let mut checksum: i64 = 0;
    let high = t.where_fn(|r| get_int(&r.data["salary"]) > 80000);
    checksum += high.rows.len() as i64;
    let eng = t.where_fn(|r| get_str(&r.data["department"]) == "Engineering");
    checksum += eng.rows.len() as i64;
    let sorted_t = t.order_by("salary", true);
    checksum += sorted_t.rows.len() as i64 - t.rows.len() as i64;
    checksum += max_of(&t.rows, "salary");
    let eng_sorted = eng.order_by("salary", true);
    checksum += eng_sorted.rows.len() as i64;
    checksum += sum_of(&t.rows, "salary");
    checksum += avg_of(&t.rows, "salary");
    checksum += min_of(&t.rows, "salary");
    checksum += max_of(&t.rows, "salary");
    let gb = group_by(&t.rows, "department");
    for dept in &gb.keys { checksum += gb.groups[dept].len() as i64; }
    let found = t.find_first(|r| get_str(&r.data["name"]) == "emp_42");
    if let Some(row) = found { checksum += get_int(&row.data["salary"]); }
    let avg = avg_of(&t.rows, "salary");
    let above = t.where_fn(|r| get_int(&r.data["salary"]) > avg);
    checksum += above.rows.len() as i64;
    checksum
}

fn main() {
    let n = 500;
    let iterations = 20;
    println!("Building table with {} rows...", n);
    let _t = build_table(n);
    println!("Running {} query iterations...", iterations);
    let mut total_checksum: i64 = 0;
    for _ in 0..iterations {
        let mut t2 = build_table(n);
        let mut checksum = run_queries(&mut t2);
        t2.update_where(
            |r| get_str(&r.data["department"]) == "Engineering",
            |mut d| { let sal = get_int(&d["salary"]); d.insert("salary".into(), Value::Int(sal + sal / 10)); d }
        );
        checksum += sum_of(&t2.rows, "salary");
        let removed = t2.delete_where(|r| get_int(&r.data["age"]) < 25);
        checksum += removed as i64;
        checksum += t2.rows.len() as i64;
        total_checksum += checksum;
    }
    println!("Total checksum: {}", total_checksum);
    println!("Database heavy complete.");
}
