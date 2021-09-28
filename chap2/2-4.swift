import Foundation

/// Append node to head
/// head: [1, 2], node: [3] -> [1, 2, 3]
func appendNode<T>(_ head: LinkedListNode<T>?, node: LinkedListNode<T>) {
    if head != nil {
        head!.next = node
    }
}

func splitList<T>(_ head: LinkedListNode<T>, _ target: T) -> LinkedListNode<T> {
    var node: LinkedListNode<T>? = head

    var resultHead: LinkedListNode<T>?
    var greaterHead: LinkedListNode<T>?

    var lowerNode: LinkedListNode<T>?
    var greaterNode: LinkedListNode<T>?

    while node != nil {
        if node!.value < target {
            appendNode(lowerNode, node: node!)
            lowerNode = node
            if resultHead == nil {
                resultHead = node!
            }
        } else {
            appendNode(greaterNode, node: node!)
            greaterNode = node
            if greaterHead == nil {
                greaterHead = node!
            }
        }

        node = node!.next
    }

    lowerNode!.next = greaterHead
    greaterNode!.next = nil

    return resultHead!
}

func checkResult<T>(_ head: LinkedListNode<T>, _ target: T) -> Bool {
    var node: LinkedListNode<T>? = head
    var isLater = false
    while node != nil {
        if !isLater && node!.value >= target {
            isLater = true
        } else if isLater && node!.value < target {
            return false
        }

        node = node!.next
    }

    return true
}

let inputs = [
    (LinkedListNode(3, 5, 8, 5, 10, 2, 1), 5),
    (LinkedListNode(5, 4, 3, 2, 1), 3),
    (LinkedListNode(10, 10, 10, 2, 1, 1, 1), 2),
    (LinkedListNode(1, 1, 1, 2, 10, 10, 10), 2),
]

for input in inputs {
    let result = splitList(input.0, input.1)
    let ok = checkResult(result, input.1)
    print("result: \(result) => \(ok ? "OK" : "NG")")
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
