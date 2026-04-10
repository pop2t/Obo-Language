public class Bench {
    static class TreeNode {
        TreeNode left, right;
    }

    static TreeNode makeTree(int depth) {
        TreeNode node = new TreeNode();
        if (depth > 0) {
            node.left = makeTree(depth - 1);
            node.right = makeTree(depth - 1);
        }
        return node;
    }

    static int checkTree(TreeNode node) {
        if (node.left == null) return 1;
        return 1 + checkTree(node.left) + checkTree(node.right);
    }

    public static void main(String[] args) {
        int minDepth = 4;
        int maxDepth = 10;
        int stretchDepth = maxDepth + 1;

        TreeNode stretch = makeTree(stretchDepth);
        System.out.printf("stretch tree of depth %d\t check: %d%n", stretchDepth, checkTree(stretch));

        TreeNode longLived = makeTree(maxDepth);

        for (int d = minDepth; d <= maxDepth; d += 2) {
            int iterations = 1;
            for (int j = 0; j < maxDepth - d + minDepth; j++) {
                iterations *= 2;
            }

            int check = 0;
            for (int i = 1; i <= iterations; i++) {
                TreeNode t = makeTree(d);
                check += checkTree(t);
            }
            System.out.printf("%d\t trees of depth %d\t check: %d%n", iterations, d, check);
        }

        System.out.printf("long lived tree of depth %d\t check: %d%n", maxDepth, checkTree(longLived));
    }
}
