"""OBO Benchmark: Binary Trees (Benchmarks Game)
Tests: recursive object allocation, tree traversal, memory management"""

import sys
sys.setrecursionlimit(1000000)


class TreeNode:
    __slots__ = ('left', 'right')
    def __init__(self, left, right):
        self.left = left
        self.right = right


def make_tree(depth):
    if depth == 0:
        return TreeNode(None, None)
    return TreeNode(make_tree(depth - 1), make_tree(depth - 1))


def check_tree(node):
    if node.left is None:
        return 1
    return 1 + check_tree(node.left) + check_tree(node.right)


def main():
    min_depth = 4
    max_depth = 10
    stretch_depth = max_depth + 1

    stretch = make_tree(stretch_depth)
    print("stretch tree of depth " + str(stretch_depth) + "\t check: " + str(check_tree(stretch)))

    long_lived = make_tree(max_depth)

    d = min_depth
    while d <= max_depth:
        iterations = 1
        for _ in range(max_depth - d + min_depth):
            iterations *= 2

        check = 0
        for _ in range(1, iterations + 1):
            check += check_tree(make_tree(d))

        print(str(iterations) + "\t trees of depth " + str(d) + "\t check: " + str(check))
        d += 2

    print("long lived tree of depth " + str(max_depth) + "\t check: " + str(check_tree(long_lived)))


main()
