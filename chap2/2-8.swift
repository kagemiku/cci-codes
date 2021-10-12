import Foundation

func isCircularList(_ head: LinkedListNode<Int>) -> LinkedListNode<Int> {
    var ptrSet = Set<Int>()
    var node: LinkedListNode<Int>? = head
    while node != nil {
        if ptrSet.contains(node!.value) {
            return node!
        }

        ptrSet.insert(node!.value)
        node = node!.next
    }

    fatalError("head should be circular")
}

// [0, 1, 2, 3, 4, 5, 3]
let input1: (LinkedListNode<Int>, LinkedListNode<Int>) = {
    let head = LinkedListNode(0, 1, 2)
    let circular = LinkedListNode(3, 4, 5)
    head.appendToTail(circular)
    circular.appendToTail(circular)

    return (head, circular)
}()

// [0, 1, 2, 0]
let input2: (LinkedListNode<Int>, LinkedListNode<Int>) = {
    let head = LinkedListNode(0, 1, 2)
    head.appendToTail(head)
    return (head, head)
}()

let inputs = [
    input1,
    input2,
]


for input in inputs {
    let result = isCircularList(input.0)
    let expected = input.1
    let ok = result === expected
    print("result: \(result.value), expected: \(expected.value) => \(ok ? "OK" : "NG")")
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
