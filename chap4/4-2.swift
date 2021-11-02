import Foundation

// e.g., array: [1, 2, 3, 4, 5]
func createBinaryTree(from array: [Int]) -> MyBinaryTree {
    // e.g., 3
    let midIndex = array.count / 2
    let node = MyBinaryTree(value: array[midIndex])

    // e.g., [1, 2]
    let leftPart = Array(array.prefix(midIndex))
    if !leftPart.isEmpty {
        node.left = createBinaryTree(from: leftPart)
    }

    // e.g., [4, 5]
    let rightPart = Array(array.suffix(array.count - midIndex - 1))
    if !rightPart.isEmpty {
        node.right = createBinaryTree(from: rightPart)
    }

    return node
}

class MyBinaryTree {
    let value: Int
    var left: MyBinaryTree?
    var right: MyBinaryTree?

    init(value: Int, left: MyBinaryTree? = nil, right: MyBinaryTree? = nil) {
        self.value = value
        self.left = left
        self.right = right
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

let array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
let result = createBinaryTree(from: array)
printTree(result)
