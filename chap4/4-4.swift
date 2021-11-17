import Foundation

// Return max depth of tree's children
func isEquilibrium(_ tree: MyBinaryTree, depth: Int) -> (Bool, Int) {
    // check left tree's depth
    var leftDepth = depth
    var leftResult = true
    if let left = tree.left {
        (leftResult, leftDepth) = isEquilibrium(left, depth: depth + 1)
    }

    // check right tree's depth
    var rightDepth = depth
    var rightResult = true
    if let right = tree.right {
        (rightResult, rightDepth) = isEquilibrium(right, depth: depth + 1)
    }

    // check the depth diff between left and right
    if !leftResult || !rightResult || abs(leftDepth - rightDepth) > 1 {
        return (false, depth)
    }

    return (true, max(leftDepth, rightDepth))
}

class MyBinaryTree: CustomStringConvertible {
    let value: Int
    var left: MyBinaryTree?
    var right: MyBinaryTree?

    init(value: Int, left: MyBinaryTree? = nil, right: MyBinaryTree? = nil) {
        self.value = value
        self.left = left
        self.right = right
    }

    var description: String {
        String(value)
    }
}

func printTree(_ tree: MyBinaryTree, depth: Int = 0) {
    let indent = String(repeating: " ", count: depth)
    print(indent + String(tree.value))
    if let left = tree.left {
        printTree(left, depth: depth + 1)
    }
    if let right = tree.right {
        printTree(right, depth: depth + 1)
    }
}

let input1 = MyBinaryTree(
    value: 8,
    left: MyBinaryTree(value: 4, left: MyBinaryTree(value: 2), right: MyBinaryTree(value: 6)),
    right: MyBinaryTree(value: 10, right: MyBinaryTree(value: 20))
)

let input2 = MyBinaryTree(
    value: 8,
    left: MyBinaryTree(
        value: 4,
        left: MyBinaryTree(value: 2, left: MyBinaryTree(value: 6))
    ),
    right: MyBinaryTree(
        value: 10,
        right: MyBinaryTree(value: 20)
    )
)

let input3 = MyBinaryTree(
    value: 30,
    left: MyBinaryTree(
        value: 10,
        left: MyBinaryTree(
            value: 5,
            left: MyBinaryTree(value: 6)
        ),
        right: MyBinaryTree(
            value: 20,
            left: MyBinaryTree(value: 15),
            right: MyBinaryTree(value: 25)
        )
    ),
    right: MyBinaryTree(value: 35)
)

print(isEquilibrium(input1, depth: 0).0)
print(isEquilibrium(input2, depth: 0).0)
print(isEquilibrium(input3, depth: 0).0)
