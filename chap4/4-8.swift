import Foundation

func findCommonParent(node1: MyBinaryTree, node2: MyBinaryTree) -> MyBinaryTree {
    guard node1 !== node2 else {
        return node1
    }

    var memo = [MyBinaryTree]()
    var current1 = node1
    var current2 = node2

    while current1.parent != nil || current2.parent != nil {
        if let parent1 = current1.parent {
            if memo.contains(where: { $0 === parent1 }) {
                return parent1
            } else {
                memo.append(parent1)
                current1 = parent1
            }
        }

        if let parent2 = current2.parent {
            if memo.contains(where: { $0 === parent2 }) {
                return parent2
            } else {
                memo.append(parent2)
                current2 = parent2
            }
        }
    }

    fatalError("There is no common parent node")
}

class MyBinaryTree: CustomStringConvertible {
    let value: Int
    var parent: MyBinaryTree?
    var left: MyBinaryTree?
    var right: MyBinaryTree?

    init(value: Int, left: MyBinaryTree? = nil, right: MyBinaryTree? = nil) {
        self.value = value
        self.left = left
        self.right = right

        self.left?.parent = self
        self.right?.parent = self
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

let input1: (MyBinaryTree, MyBinaryTree, MyBinaryTree) = {
    let target1 = MyBinaryTree(value: 2)
    let target2 = MyBinaryTree(value: 6)
    let tree = MyBinaryTree(
        value: 8,
        left: MyBinaryTree(value: 4, left: target1, right: target2),
        right: MyBinaryTree(value: 10, right: MyBinaryTree(value: 20))
    )
    return (tree, target1, target2)
}()

let input2: (MyBinaryTree, MyBinaryTree, MyBinaryTree) = {
    let target1 = MyBinaryTree(value: 6)
    let target2 = MyBinaryTree(value: 20)
    let tree = MyBinaryTree(
        value: 8,
        left: MyBinaryTree(value: 4, left: MyBinaryTree(value: 2), right: target1),
        right: MyBinaryTree(value: 10, right: target2)
    )
    return (tree, target1, target2)
}()

let input3: (MyBinaryTree, MyBinaryTree, MyBinaryTree) = {
    let target1 = MyBinaryTree(value: 6)
    let target2 = MyBinaryTree(value: 5)
    let tree = MyBinaryTree(
        value: 8,
        left: MyBinaryTree(
            value: 4,
            left: MyBinaryTree(value: 2, left: target1, right: MyBinaryTree(value: 11)),
            right: target2
        ),
        right: MyBinaryTree(value: 10)
    )
    return (tree, target1, target2)
}()


print(findCommonParent(node1: input1.1, node2: input1.2))
print(findCommonParent(node1: input2.1, node2: input2.2))
print(findCommonParent(node1: input3.1, node2: input3.2))
