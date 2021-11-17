import Foundation

func isBST(_ tree: MyBinaryTree) -> (Bool, Int) {
    var currentValue = 0

    if let left = tree.left {
        let (result, value) = isBST(left)
        if !result {
            return (false, 0)
        }
        currentValue = value
    }

    if currentValue > tree.value {
        return (false, 0)
    } else {
        currentValue = tree.value
    }

    if let right = tree.right {
        let (result, value) = isBST(right)
        if !result || currentValue > value {
            return (false, 0)
        }
        currentValue = value
    }

    return (true, currentValue)
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
    left: MyBinaryTree(value: 4, left: MyBinaryTree(value: 2), right: MyBinaryTree(value: 12)),
    right: MyBinaryTree(value: 10, right: MyBinaryTree(value: 20))
)


print(isBST(input1).0)
print(isBST(input2).0)
