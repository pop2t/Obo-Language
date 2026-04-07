function fib(n) {
    if (n < 2) return n;
    return fib(n - 1) + fib(n - 2);
}

var result = fib(35);
console.log("fib(35) = " + result);
