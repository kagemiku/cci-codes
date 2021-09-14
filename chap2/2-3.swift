import Foundation

func deleteNode<T>(_ target: LinkedListNode<T>) {
    target.value = target.next!.value
    target.next = target.next!.next
}

var input1: (LinkedListNode<Int>, LinkedListNode<Int>) {
    let head = LinkedListNode(value: 0)
    let target = LinkedListNode(value: 1)
    head.appendToTail(target)
    head.appendToTail(2)
    head.appendToTail(3)

    return (head, target)
}

var input2: (LinkedListNode<Int>, LinkedListNode<Int>) {
    let head = LinkedListNode(value: 0)
    head.appendToTail(1)
    let target = LinkedListNode(value: 2)
    head.appendToTail(target)
    head.appendToTail(3)

    return (head, target)
}

let inputs = [
    (input1, LinkedListNode(0, 2, 3)),
    (input2, LinkedListNode(0, 1, 3)),
]

for input in inputs {
    deleteNode(input.0.1)
    let result = input.0.0
    let expected = input.1
    let ok = result == expected
    print("result: \(result), expected: \(expected) => \(ok ? "OK" : "NG")")
}

final class LinkedListNode<T: Equatable & CustomStringConvertible>: CustomStringConvertible, Equatable {
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
