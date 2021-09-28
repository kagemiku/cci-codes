import Foundation

/// Basic
/// [7, 1, 6] -> 617
func listToNumber(_ head: LinkedListNode<Int>) -> Int {
    var result = 0
    var node: LinkedListNode<Int>? = head
    var index = 0
    while node != nil {
        result += node!.value * Int(pow(10.0, Double(index)))
        node = node!.next
        index += 1
    }

    return result
}

/// 617 -> [7, 1, 6]
func numberToList(_ number: Int) -> LinkedListNode<Int> {
    var head: LinkedListNode<Int>?
    var node: LinkedListNode<Int>?

    var num = number

    while num != 0 {
        let newNode = LinkedListNode(value: num % 10)
        if head == nil {
            head = newNode
        }
        if node != nil {
            node!.next = newNode
        }

        node = newNode
        num /= 10
    }

    return head!
}

/// Advanced
/// [7, 1, 6] -> 716
func listToNumber2(_ head: LinkedListNode<Int>) -> Int {
    var result = 0
    var node: LinkedListNode<Int>? = head
    while node != nil {
        result = result * 10 + node!.value
        node = node!.next
    }

    return result
}

/// 617 -> [6, 1, 7]
func numberToList2(_ number: Int) -> LinkedListNode<Int> {
    var head: LinkedListNode<Int>?
    var num = number

    while num != 0 {
        let newNode = LinkedListNode(value: num % 10)
        if head != nil {
            newNode.next = head
        }
        head = newNode

        num /= 10
    }

    return head!
}


func addLists(_ lhs: LinkedListNode<Int>, _ rhs: LinkedListNode<Int>) -> LinkedListNode<Int> {
    let lhsValue = listToNumber(lhs)
    let rhsValue = listToNumber(rhs)
    return numberToList(lhsValue + rhsValue)
}

func addLists2(_ lhs: LinkedListNode<Int>, _ rhs: LinkedListNode<Int>) -> LinkedListNode<Int> {
    let lhsValue = listToNumber2(lhs)
    let rhsValue = listToNumber2(rhs)
    return numberToList2(lhsValue + rhsValue)
}

let inputs = [
    (LinkedListNode(7, 1, 6), LinkedListNode(5, 9, 2), LinkedListNode(2, 1, 9)),
    (LinkedListNode(7, 1), LinkedListNode(5, 9, 2), LinkedListNode(2, 1, 3)),
    (LinkedListNode(7, 1, 6), LinkedListNode(5, 9), LinkedListNode(2, 1, 7)),
    (LinkedListNode(9), LinkedListNode(9), LinkedListNode(8, 1)),
]

let inputs2 = [
    (LinkedListNode(7, 1, 6), LinkedListNode(5, 9, 2), LinkedListNode(1, 3, 0, 8)),
    (LinkedListNode(7, 1), LinkedListNode(5, 9, 2), LinkedListNode(6, 6, 3)),
    (LinkedListNode(7, 1, 6), LinkedListNode(5, 9), LinkedListNode(7, 7, 5)),
    (LinkedListNode(9), LinkedListNode(9), LinkedListNode(1, 8)),
]

for input in inputs {
    let result = addLists(input.0, input.1)
    let expected = input.2
    let ok = result == expected
    print("result: \(result), expected: \(expected) => \(ok ? "OK" : "NG")")

}

print(" --- advanced --- ")

for input in inputs2 {
    let result = addLists2(input.0, input.1)
    let expected = input.2
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
