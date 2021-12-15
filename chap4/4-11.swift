import Foundation

func getRandomNode(from tree: MyBinaryTree) -> MyBinaryTree {
    if tree.left == nil && tree.right == nil {
        return tree
    }

    let value = Int.random(in: 0..<tree.count)
    let leftCount = tree.left?.count ?? 0

    if value < leftCount {
        return getRandomNode(from: tree.left!)
    } else if value == leftCount {
        return tree
    } else {
        return getRandomNode(from: tree.right!)
    }
}

class MyBinaryTree: CustomStringConvertible, Equatable {
    let value: Int
    private (set) var left: MyBinaryTree?
    private (set) var right: MyBinaryTree?
    var count: Int

    init(value: Int, left: MyBinaryTree? = nil, right: MyBinaryTree? = nil) {
        self.value = value
        self.left = left
        self.right = right

        self.count = (left?.count ?? 0) + (right?.count ?? 0) + 1
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
    print(indent + String(tree.value), tree.count)
    if let left = tree.left {
        printTree(left, depth: depth + 1)
    }
    if let right = tree.right {
        printTree(right, depth: depth + 1)
    }
}

let input0 = MyBinaryTree(
    value: 8,
    left: MyBinaryTree(
        value: 4,
        left: MyBinaryTree(value: 2, left: MyBinaryTree(value: 1)),
        right: MyBinaryTree(value: 6)
    ),
    right: MyBinaryTree(value: 10, right: MyBinaryTree(value: 20))
)


var histgram = [Int: Int]()
let totalCount = 10000
for _ in 0..<totalCount {
    let node = getRandomNode(from: input0)
    histgram[node.value, default: 0] += 1
}

for (value, count) in histgram {
    let percentage = Int(Double(count) / Double(totalCount) * 100)
    print("\(value): \(count) \(percentage)%")
}
