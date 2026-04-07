class TreeNode {
    constructor(left, right) {
        this.left = left;
        this.right = right;
    }
}

function makeTree(depth) {
    if (depth === 0) return new TreeNode(null, null);
    return new TreeNode(makeTree(depth - 1), makeTree(depth - 1));
}

function checkTree(node) {
    if (node.left === null) return 1;
    return 1 + checkTree(node.left) + checkTree(node.right);
}

function main() {
    var minDepth = 4;
    var maxDepth = 10;
    var stretchDepth = maxDepth + 1;

    var stretch = makeTree(stretchDepth);
    console.log("stretch tree of depth " + stretchDepth + "\t check: " + checkTree(stretch));

    var longLived = makeTree(maxDepth);

    for (var d = minDepth; d <= maxDepth; d += 2) {
        var iterations = 1;
        for (var i = 0; i < maxDepth - d + minDepth; i++) {
            iterations *= 2;
        }

        var check = 0;
        for (var i = 1; i <= iterations; i++) {
            check += checkTree(makeTree(d));
        }

        console.log(iterations + "\t trees of depth " + d + "\t check: " + check);
    }

    console.log("long lived tree of depth " + maxDepth + "\t check: " + checkTree(longLived));
}

main();
