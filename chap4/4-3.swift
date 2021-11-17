import Foundation

func createList(from tree: MyBinaryTree) -> [[MyBinaryTree]] {
    var result = [[MyBinaryTree]]()
    var q = [tree]

    while !q.isEmpty {
        var nextQ = [MyBinaryTree]()
        var list = [MyBinaryTree]()
        while !q.isEmpty {
            let node = q.removeFirst()
            list.append(node)

            if let left = node.left {
                nextQ.append(left)
            }
            if let right = node.right {
                nextQ.append(right)
            }
        }

        q = nextQ
        result.append(list)
    }

    return result
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

let input = MyBinaryTree(
    value: 8,
    left: MyBinaryTree(value: 4, left: MyBinaryTree(value: 2), right: MyBinaryTree(value: 6)),
    right: MyBinaryTree(value: 10, right: MyBinaryTree(value: 20))
)

let result = createList(from: input)
print(result)
