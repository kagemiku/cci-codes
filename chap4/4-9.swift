import Foundation

/// merge arrays keeping order in each array
/// [1, 2] + [3, 4] => [[1, 2, 3, 4], [1, 3, 2, 4], [1, 3, 4, 2], [3, 1, 2, 4], [3, 1, 4, 2], [3, 4, 1, 2]]
func mergeArrays(arr1: [Int], arr2: [Int], prefix: [Int]) -> [[Int]] {
    if arr1.isEmpty {
        return [prefix + arr2]
    } else if arr2.isEmpty {
        return [prefix + arr1]
    }

    let arr1Result = mergeArrays(arr1: Array(arr1.dropFirst()), arr2: arr2, prefix: prefix + [arr1.first!])
    let arr2Result = mergeArrays(arr1: arr1, arr2: Array(arr2.dropFirst()), prefix: prefix + [arr2.first!])
    return arr1Result + arr2Result
}

func generateArrays(node: MyBinaryTree) -> [[Int]] {
    // return 1 value if leaf node
    if node.left == nil && node.right == nil {
        return [[node.value]]
    }

    let leftResults = node.left.map { generateArrays(node: $0) } ?? []
    let rightResults = node.right.map { generateArrays(node: $0) } ?? []

    // no left child case
    if leftResults.isEmpty {
        return rightResults.map {
            [node.value] + $0
        }
    }

    // no right child case
    if rightResults.isEmpty {
        return leftResults.map {
            [node.value] + $0
        }
    }

    var result = [[Int]]()
    for leftResult in leftResults {
        for rightResult in rightResults {
            let merged = mergeArrays(arr1: leftResult, arr2: rightResult, prefix: []).map {
                [node.value] + $0
            }

            result += merged
        }
    }

    return result
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

let input0 = MyBinaryTree(value: 2, left: MyBinaryTree(value: 1), right: MyBinaryTree(value: 3))

let input1 = MyBinaryTree(
    value: 5,
    left: MyBinaryTree(value: 3, left: MyBinaryTree(value: 1), right: MyBinaryTree(value: 4)),
    right: MyBinaryTree(value: 6)
)

let input2 = MyBinaryTree(
    value: 8,
    left: MyBinaryTree(
        value: 4,
        left: MyBinaryTree(value: 2, left: MyBinaryTree(value: 1)),
        right: MyBinaryTree(value: 6)
    ),
    right: MyBinaryTree(value: 10, right: MyBinaryTree(value: 20))
)

//print(mergeArrays(arr1: [1, 2], arr2: [3, 4], prefix: []))
print(generateArrays(node: input0), "\n")
print(generateArrays(node: input1), "\n")
print(generateArrays(node: input2), "\n")
