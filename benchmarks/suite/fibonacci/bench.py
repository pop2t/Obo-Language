"""OBO Benchmark: Fibonacci (recursive)
Tests: function call overhead, recursion depth, integer arithmetic"""

import sys
sys.setrecursionlimit(100000)

def fib(n):
    if n < 2:
        return n
    return fib(n - 1) + fib(n - 2)

result = fib(35)
print("fib(35) = " + str(result))
