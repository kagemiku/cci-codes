import Foundation

func isPalindrome<T>(_ head: LinkedListNode<T>) -> Bool {
    var node: LinkedListNode<T>? = head
    var revHead: LinkedListNode<T>?
    while node != nil {
        let revNode = LinkedListNode(value: node!.value)
        if revHead != nil {
            revNode.next = revHead
        }
        revHead = revNode

        node = node!.next
    }

    return head == revHead
}

let inputs = [
    (LinkedListNode("a", "b", "c", "b", "a"), true),
    (LinkedListNode("a", "b", "c", "b", "a", "a"), false),
    (LinkedListNode("a", "b", "c", "c", "b", "a"), true),
]


for input in inputs {
    let result = isPalindrome(input.0)
    let expected = input.1
    let ok = result == expected
    print("result: \(result), expected: \(expected) => \(ok ? "OK" : "NG")")

}

final class LinkedListNode<T: Equatable & Comparable & CustomStringConvertible>: CustomStringConvertible, Equatable {
    var value: T
    var next: LinkedListNode<T>?

    init(value: T) {
        self.value = value
    }

    func appendToTail(_ value: T) {
        let end = LinkedListNode(value: value)
        var node = self
        while node.next != nil {
            node = node.next!
        }
        node.next = end
    }

    func appendToTail(_ end: LinkedListNode<T>) {
        var node = self
        while node.next != nil {
            node = node.next!
        }
        node.next = end
    }
}

extension LinkedListNode {
    convenience init(_ values: T...) {
        guard let first = values.first else {
            fatalError()
        }

        self.init(value: first)
        for v in values.dropFirst() {
            appendToTail(v)
        }
    }

    var description: String {
        var elements = ["["]
        var node: LinkedListNode<T>? = self
        repeat {
            elements.append("\(node!.value), ")
            node = node!.next
        } while node != nil

        elements.append("]")

        return elements.joined()

    }

    static func == (lhs: LinkedListNode<T>, rhs: LinkedListNode<T>) -> Bool {
        lhs.description == rhs.description
    }
}
