#include <cstdio>

struct TreeNode {
    TreeNode* left;
    TreeNode* right;
};

TreeNode* make_tree(int depth) {
    TreeNode* node = new TreeNode();
    if (depth == 0) {
        node->left = nullptr;
        node->right = nullptr;
    } else {
        node->left = make_tree(depth - 1);
        node->right = make_tree(depth - 1);
    }
    return node;
}

int check_tree(TreeNode* node) {
    if (node->left == nullptr) return 1;
    return 1 + check_tree(node->left) + check_tree(node->right);
}

void free_tree(TreeNode* node) {
    if (node->left) {
        free_tree(node->left);
        free_tree(node->right);
    }
    delete node;
}

int main() {
    int min_depth = 4;
    int max_depth = 10;
    int stretch_depth = max_depth + 1;

    TreeNode* stretch = make_tree(stretch_depth);
    printf("stretch tree of depth %d\t check: %d\n", stretch_depth, check_tree(stretch));
    free_tree(stretch);

    TreeNode* long_lived = make_tree(max_depth);

    for (int d = min_depth; d <= max_depth; d += 2) {
        int iterations = 1;
        for (int i = 0; i < max_depth - d + min_depth; i++) {
            iterations *= 2;
        }

        int check = 0;
        for (int i = 1; i <= iterations; i++) {
            TreeNode* t = make_tree(d);
            check += check_tree(t);
            free_tree(t);
        }

        printf("%d\t trees of depth %d\t check: %d\n", iterations, d, check);
    }

    printf("long lived tree of depth %d\t check: %d\n", max_depth, check_tree(long_lived));
    free_tree(long_lived);
    return 0;
}
