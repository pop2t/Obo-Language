fn fib(n: i32) -> i32 {
    if n < 2 { return n; }
    fib(n - 1) + fib(n - 2)
}

fn main() {
    let result = fib(35);
    println!("fib(35) = {}", result);
}
