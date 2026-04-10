import java.util.HashMap;
import java.util.ArrayList;

public class Bench {
    static Object getInt(HashMap<String, Object> data, String key) {
        return data.get(key);
    }

    static long asInt(Object v) { return (Long) v; }
    static String asStr(Object v) { return (String) v; }

    static int[][] sortRows(ArrayList<HashMap<String, Object>> rows, String column, boolean ascending) {
        int n = rows.size();
        int[] result = new int[n];
        ArrayList<Integer> remaining = new ArrayList<>();
        for (int i = 0; i < n; i++) remaining.add(i);

        for (int idx = 0; idx < n; idx++) {
            int best = 0;
            for (int i = 1; i < remaining.size(); i++) {
                long a = asInt(rows.get(remaining.get(i)).get(column));
                long b = asInt(rows.get(remaining.get(best)).get(column));
                if (ascending && a < b) best = i;
                if (!ascending && a > b) best = i;
            }
            result[idx] = remaining.get(best);
            remaining.remove(best);
        }
        return new int[][]{result};
    }

    static long sumOf(ArrayList<HashMap<String, Object>> rows, String column) {
        long total = 0;
        for (var row : rows) total += asInt(row.get(column));
        return total;
    }

    static long avgOf(ArrayList<HashMap<String, Object>> rows, String column) {
        if (rows.isEmpty()) return 0;
        return sumOf(rows, column) / rows.size();
    }

    static long minOf(ArrayList<HashMap<String, Object>> rows, String column) {
        long best = asInt(rows.get(0).get(column));
        for (var row : rows) {
            long v = asInt(row.get(column));
            if (v < best) best = v;
        }
        return best;
    }

    static long maxOf(ArrayList<HashMap<String, Object>> rows, String column) {
        long best = asInt(rows.get(0).get(column));
        for (var row : rows) {
            long v = asInt(row.get(column));
            if (v > best) best = v;
        }
        return best;
    }

    static String[] departments = {"Engineering", "Marketing", "HR", "Finance", "Sales", "Support", "Legal", "R&D"};
    static String[] levels = {"Junior", "Mid", "Senior", "Lead", "Principal"};

    static ArrayList<HashMap<String, Object>> buildTable(int n) {
        ArrayList<HashMap<String, Object>> rows = new ArrayList<>();
        for (int i = 0; i < n; i++) {
            HashMap<String, Object> record = new HashMap<>();
            record.put("name", "emp_" + i);
            record.put("department", departments[i % 8]);
            record.put("salary", (long) (40000 + (i * 37 + 17) % 80000));
            record.put("age", (long) (22 + i % 30));
            record.put("level", levels[i % 5]);
            rows.add(record);
        }
        return rows;
    }

    static long runQueries(ArrayList<HashMap<String, Object>> rows) {
        long checksum = 0;

        // WHERE
        ArrayList<HashMap<String, Object>> high = new ArrayList<>();
        for (var r : rows) { if (asInt(r.get("salary")) > 80000) high.add(r); }
        checksum += high.size();

        ArrayList<HashMap<String, Object>> eng = new ArrayList<>();
        for (var r : rows) { if (asStr(r.get("department")).equals("Engineering")) eng.add(r); }
        checksum += eng.size();

        // ORDER BY
        sortRows(rows, "salary", true);
        checksum += rows.size() - rows.size();
        checksum += maxOf(rows, "salary");

        sortRows(eng, "salary", true);
        checksum += eng.size();

        // Aggregates
        checksum += sumOf(rows, "salary");
        checksum += avgOf(rows, "salary");
        checksum += minOf(rows, "salary");
        checksum += maxOf(rows, "salary");

        // GROUP BY
        HashMap<String, ArrayList<HashMap<String, Object>>> groups = new HashMap<>();
        ArrayList<String> keys = new ArrayList<>();
        for (var row : rows) {
            String dept = asStr(row.get("department"));
            if (!groups.containsKey(dept)) {
                groups.put(dept, new ArrayList<>());
                keys.add(dept);
            }
            groups.get(dept).add(row);
        }
        for (String dept : keys) {
            checksum += groups.get(dept).size();
        }

        // FIND FIRST
        for (var r : rows) {
            if (asStr(r.get("name")).equals("emp_42")) {
                checksum += asInt(r.get("salary"));
                break;
            }
        }

        long avg = avgOf(rows, "salary");
        ArrayList<HashMap<String, Object>> above = new ArrayList<>();
        for (var r : rows) { if (asInt(r.get("salary")) > avg) above.add(r); }
        checksum += above.size();

        return checksum;
    }

    public static void main(String[] args) {
        int n = 500;
        int iterations = 20;

        System.out.printf("Building table with %d rows...%n", n);
        buildTable(n);
        System.out.printf("Running %d query iterations...%n", iterations);

        long totalChecksum = 0;
        for (int iter = 0; iter < iterations; iter++) {
            var rows = buildTable(n);
            long checksum = runQueries(rows);

            // UPDATE
            for (var r : rows) {
                if (asStr(r.get("department")).equals("Engineering")) {
                    long sal = asInt(r.get("salary"));
                    r.put("salary", sal + sal / 10);
                }
            }
            checksum += sumOf(rows, "salary");

            // DELETE
            ArrayList<HashMap<String, Object>> kept = new ArrayList<>();
            int removed = 0;
            for (var r : rows) {
                if (asInt(r.get("age")) < 25) {
                    removed++;
                } else {
                    kept.add(r);
                }
            }
            checksum += removed;
            checksum += kept.size();

            totalChecksum += checksum;
        }

        System.out.printf("Total checksum: %d%n", totalChecksum);
        System.out.println("Database heavy complete.");
    }
}
