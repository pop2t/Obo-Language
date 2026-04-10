public class Bench {
    static int fib(int n) {
        if (n < 2) return n;
        return fib(n - 1) + fib(n - 2);
    }

    public static void main(String[] args) {
        int result = fib(35);
        System.out.printf("fib(35) = %d%n", result);
    }
}
