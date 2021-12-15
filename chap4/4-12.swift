import Foundation

var memo = [Int: Int]()

// sum values from root node and count if that value equals to `target`
func scanFromRoot(tree: MyBinaryTree, current: Int, target: Int) -> Int {
    var result = 0
    let sum = tree.value + current
    memo[tree.id] = sum

    if let left = tree.left {
        result += scanFromRoot(tree: left, current: sum, target: target)
    }
    if let right = tree.right {
        result += scanFromRoot(tree: right, current: sum, target: target)
    }

    return sum == target ? result + 1 : result
}

func countRoute(tree: MyBinaryTree, target: Int) -> Int {
    var result = scanFromRoot(tree: tree, current: 0, target: target)
    if let left = tree.left {
        result += countRoute(tree: left, target: target)
    }
    if let right = tree.right {
        result += countRoute(tree: right, target: target)
    }

    return result
}


// instead of pointer
var counter = 0
class MyBinaryTree: CustomStringConvertible, Equatable {
    let id: Int
    let value: Int
    var parent: MyBinaryTree?
    private (set) var left: MyBinaryTree?
    private (set) var right: MyBinaryTree?

    init(value: Int, left: MyBinaryTree? = nil, right: MyBinaryTree? = nil) {
        self.id = counter
        counter += 1
        self.value = value
        self.left = left
        self.right = right

        self.left?.parent = self
        self.right?.parent = self
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
    print(indent + String(tree.value), tree.id)
    if let left = tree.left {
        printTree(left, depth: depth + 1)
    }
    if let right = tree.right {
        printTree(right, depth: depth + 1)
    }
}

let input0 = MyBinaryTree(
    value: 10,
    left: MyBinaryTree(
        value: 5,
        left: MyBinaryTree(value: 3, left: MyBinaryTree(value: 3), right: MyBinaryTree(value: -2)),
        right: MyBinaryTree(value: 2, right: MyBinaryTree(value: 1))
    ),
    right: MyBinaryTree(value: -3, right: MyBinaryTree(value: 11))
)

print(countRoute(tree: input0, target: 18))
print(countRoute(tree: input0, target: 8))
print(countRoute(tree: input0, target: 6))
