import Foundation

func findLastK<T>(_ head: LinkedListNode<T>?, lastIndex: Int) -> (T?, Int) {
    if head == nil {
        return (nil, 0)
    }

    let (value, index) = findLastK(head?.next, lastIndex: lastIndex)
    if value != nil {
        return (value!, index)
    } else {
        if index == lastIndex {
            return (head?.value, index)
        } else {
            return (nil, index + 1)
        }
    }
}

let inputs = [
    (LinkedListNode(0, 1, 2, 3), 0, 3),
    (LinkedListNode(0, 1, 2, 3), 1, 2),
    (LinkedListNode(0, 1, 2, 3), 3, 0),
]

for input in inputs {
    let result = findLastK(input.0, lastIndex: input.1).0!
    let expected = input.2
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
