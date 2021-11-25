import Foundation

func findNextNode(of node: MyBinaryTree) -> MyBinaryTree? {
    if let right = node.right {
        // case1: right node exists, get the most left node
        var result = right
        while let next = result.left {
            result = next
        }
        return result
    } else {
        // case2: no right node, go up parent nodes
        var result = node
        while let parent = result.parent {
            if parent.left === result {
                return parent
            }
            result = parent
        }
    }

    return nil
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

let input1: (MyBinaryTree, MyBinaryTree) = {
    let target = MyBinaryTree(value: 2)
    let tree = MyBinaryTree(
        value: 8,
        left: MyBinaryTree(value: 4, left: target, right: MyBinaryTree(value: 6)),
        right: MyBinaryTree(value: 10, right: MyBinaryTree(value: 20))
    )
    return (tree, target)
}()

let input2: (MyBinaryTree, MyBinaryTree) = {
    let target = MyBinaryTree(value: 6)
    let tree = MyBinaryTree(
        value: 8,
        left: MyBinaryTree(value: 4, left: MyBinaryTree(value: 2), right: target),
        right: MyBinaryTree(value: 10, right: MyBinaryTree(value: 20))
    )
    return (tree, target)
}()

let input3: (MyBinaryTree, MyBinaryTree) = {
    let target = MyBinaryTree(value: 10, right: MyBinaryTree(value: 20))
    let tree = MyBinaryTree(
        value: 8,
        left: MyBinaryTree(value: 4, left: MyBinaryTree(value: 2), right: MyBinaryTree(value: 6)),
        right: target
    )
    return (tree, target)
}()



print(findNextNode(of: input1.1))
print(findNextNode(of: input2.1))
print(findNextNode(of: input3.1))
