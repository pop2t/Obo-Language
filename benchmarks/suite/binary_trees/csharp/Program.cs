// OBO Benchmark: Binary Trees (Benchmarks Game)
// Tests: recursive object allocation, tree traversal, memory management

using System;

static TreeNode MakeTree(int depth)
{
    if (depth == 0)
        return new TreeNode(null, null);
    return new TreeNode(MakeTree(depth - 1), MakeTree(depth - 1));
}

static int CheckTree(TreeNode node)
{
    if (node.Left == null)
        return 1;
    return 1 + CheckTree(node.Left) + CheckTree(node.Right!);
}

int minDepth = 4;
int maxDepth = 10;
int stretchDepth = maxDepth + 1;

var stretch = MakeTree(stretchDepth);
Console.WriteLine("stretch tree of depth " + stretchDepth + "\t check: " + CheckTree(stretch));

var longLived = MakeTree(maxDepth);

int d = minDepth;
while (d <= maxDepth)
{
    int iterations = 1;
    for (int j = 0; j < maxDepth - d + minDepth; j++)
        iterations *= 2;

    int check = 0;
    for (int i = 1; i <= iterations; i++)
        check += CheckTree(MakeTree(d));

    Console.WriteLine(iterations + "\t trees of depth " + d + "\t check: " + check);
    d += 2;
}

Console.WriteLine("long lived tree of depth " + maxDepth + "\t check: " + CheckTree(longLived));

class TreeNode
{
    public TreeNode Left;
    public TreeNode Right;
    public TreeNode(TreeNode left, TreeNode right)
    {
        Left = left;
        Right = right;
    }
}
