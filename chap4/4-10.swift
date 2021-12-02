import Foundation

// make node array by in-order
func flatten(node: MyBinaryTree) -> [MyBinaryTree] {
    let left = node.left.map { flatten(node: $0) } ?? []
    let right = node.right.map { flatten(node: $0) } ?? []

    return left + [node] + right
}

// make node array which has the same value with target
func find(tree: MyBinaryTree, target: Int) -> [MyBinaryTree] {
    flatten(node: tree).filter { $0.value == target }
}

func isPartial(tree1: MyBinaryTree, tree2: MyBinaryTree) -> Bool {
    let candNodes = find(tree: tree1, target: tree2.value)
    guard !candNodes.isEmpty else {
        return false
    }

    let targetArray = flatten(node: tree2)
    for candNode in candNodes {
        let candArray = flatten(node: candNode)
        if targetArray == candArray {
            return true
        }
    }

    return false
}

class MyBinaryTree: CustomStringConvertible, Equatable {
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

    static func == (lhs: MyBinaryTree, rhs: MyBinaryTree) -> Bool {
        lhs.value == rhs.value && lhs.left == rhs.left && lhs.right == rhs.right
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

let input1: (MyBinaryTree, MyBinaryTree) = (
        MyBinaryTree(
            value: 1,
            left: MyBinaryTree(
                value: 2,
                left: MyBinaryTree(value: 3, left: MyBinaryTree(value: 4), right: MyBinaryTree(value: 5)),
                right: MyBinaryTree(value: 6)
            ),
            right: MyBinaryTree(value: 5)
        ),
        MyBinaryTree(value: 3, left: MyBinaryTree(value: 4), right: MyBinaryTree(value: 5))
    )

let input2: (MyBinaryTree, MyBinaryTree) = (
        MyBinaryTree(
            value: 1,
            left: MyBinaryTree(
                value: 2,
                left: MyBinaryTree(value: 3, left: MyBinaryTree(value: 4), right: MyBinaryTree(value: 5, right: MyBinaryTree(value: 10))),
                right: MyBinaryTree(value: 6)
            ),
            right: MyBinaryTree(value: 5)
        ),
        MyBinaryTree(value: 3, left: MyBinaryTree(value: 4), right: MyBinaryTree(value: 5))
    )

print(isPartial(tree1: input1.0, tree2: input1.1))
print(isPartial(tree1: input2.0, tree2: input2.1))
