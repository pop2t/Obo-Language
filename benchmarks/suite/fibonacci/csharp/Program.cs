// OBO Benchmark: Fibonacci (recursive)
// Tests: function call overhead, recursion depth, integer arithmetic

using System;

static long Fib(int n)
{
    if (n < 2) return n;
    return Fib(n - 1) + Fib(n - 2);
}

long result = Fib(35);
Console.WriteLine("fib(35) = " + result);
