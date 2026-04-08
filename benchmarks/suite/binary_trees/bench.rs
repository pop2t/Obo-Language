struct TreeNode {
    left: Option<Box<TreeNode>>,
    right: Option<Box<TreeNode>>,
}

fn make_tree(depth: i32) -> Box<TreeNode> {
    if depth == 0 {
        Box::new(TreeNode { left: None, right: None })
    } else {
        Box::new(TreeNode {
            left: Some(make_tree(depth - 1)),
            right: Some(make_tree(depth - 1)),
        })
    }
}

fn check_tree(node: &TreeNode) -> i32 {
    match (&node.left, &node.right) {
        (Some(l), Some(r)) => 1 + check_tree(l) + check_tree(r),
        _ => 1,
    }
}

fn main() {
    let min_depth = 4;
    let max_depth = 10;
    let stretch_depth = max_depth + 1;

    let stretch = make_tree(stretch_depth);
    println!("stretch tree of depth {}\t check: {}", stretch_depth, check_tree(&stretch));
    drop(stretch);

    let long_lived = make_tree(max_depth);

    let mut d = min_depth;
    while d <= max_depth {
        let mut iterations = 1;
        for _ in 0..(max_depth - d + min_depth) {
            iterations *= 2;
        }
        let mut check = 0;
        for _ in 0..iterations {
            let t = make_tree(d);
            check += check_tree(&t);
        }
        println!("{}\t trees of depth {}\t check: {}", iterations, d, check);
        d += 2;
    }

    println!("long lived tree of depth {}\t check: {}", max_depth, check_tree(&long_lived));
}
