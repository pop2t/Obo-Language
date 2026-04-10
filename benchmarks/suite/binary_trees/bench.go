package main

import "fmt"

type TreeNode struct {
	left  *TreeNode
	right *TreeNode
}

func makeTree(depth int) *TreeNode {
	node := &TreeNode{}
	if depth > 0 {
		node.left = makeTree(depth - 1)
		node.right = makeTree(depth - 1)
	}
	return node
}

func checkTree(node *TreeNode) int {
	if node.left == nil {
		return 1
	}
	return 1 + checkTree(node.left) + checkTree(node.right)
}

func main() {
	minDepth := 4
	maxDepth := 10
	stretchDepth := maxDepth + 1

	stretch := makeTree(stretchDepth)
	fmt.Printf("stretch tree of depth %d\t check: %d\n", stretchDepth, checkTree(stretch))

	longLived := makeTree(maxDepth)

	for d := minDepth; d <= maxDepth; d += 2 {
		iterations := 1
		for j := 0; j < maxDepth-d+minDepth; j++ {
			iterations *= 2
		}

		check := 0
		for i := 1; i <= iterations; i++ {
			t := makeTree(d)
			check += checkTree(t)
		}
		fmt.Printf("%d\t trees of depth %d\t check: %d\n", iterations, d, check)
	}

	fmt.Printf("long lived tree of depth %d\t check: %d\n", maxDepth, checkTree(longLived))
}
