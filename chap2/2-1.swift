import Foundation

// O(N)
// head: [0, 1, 1, 0], value: 1 -> [0, 0]
// head: [0, 1, 1, 0], value: 0 -> [1, 1]
// head: [0, 0, 0, 0], value: 0 -> nil
func removeValues<T>(_ head: LinkedListNode<T>, value: T) -> LinkedListNode<T>? {
    // find head where head.value != value
    var head: LinkedListNode<T>? = head
    while head?.value == value {
        head = head?.next
    }

    // remove `value` element after head
    var node = head
    while node?.next != nil {
        if node?.next?.value == value {
            node?.next = node?.next?.next
        } else {
            node = node?.next
        }
    }

    return head
}

// O(N^2)
func removeDuplicates<T>(_ head: LinkedListNode<T>) {
    var node: LinkedListNode<T>? = head
    while node?.next != nil {
        // [0, 1, 0, 0, 2] => [0, 1, 2]
        node?.next = removeValues(node!.next!, value: node!.value)
        node = node!.next
    }
}

let inputs = [
    (LinkedListNode(0, 0, 1, 1), LinkedListNode(0, 1)),
    (LinkedListNode(0, 0, 1, 1, 2), LinkedListNode(0, 1, 2)),
    (LinkedListNode(0, 1, 2, 3), LinkedListNode(0, 1, 2, 3)),
    (LinkedListNode(0, 1, 2, 3, 3, 3), LinkedListNode(0, 1, 2, 3)),
]

for input in inputs {
    let original = input.0
    removeDuplicates(original)
    let result = original
    let expected = input.1
    let ok = result == expected
    print("result: \(result), expected: \(expected) => \(ok ? "OK" : "NG")")
}

final class LinkedListNode<T: Equatable & CustomStringConvertible>: CustomStringConvertible, Equatable {
    let value: T
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
