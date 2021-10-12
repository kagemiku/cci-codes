import Foundation

// [0, 1, 2] -> 3
func listLength<T>(_ head: LinkedListNode<T>) -> Int {
    var length = 0
    var node: LinkedListNode<T>? = head
    while node != nil {
        node = node!.next
        length += 1
    }

    return length
}

// return non-nil node if head1 contains part of head2
// assumption: head1.length > head2.length
// [0, 1, 2, 3], [5, 1, 2, 3] -> [1, 2, 3]
// [1, 2],       [2]          -> [2]
// [3, 3],       [4, 4]       -> nil
func containNodes<T>(head1: LinkedListNode<T>, head2: LinkedListNode<T>, offset: Int) -> LinkedListNode<T>? {
    var node1: LinkedListNode<T>? = head1
    var node2: LinkedListNode<T>? = head2
    var offset = offset
    while offset > 0 {
        node1 = node1!.next
        offset -= 1
    }

    while node1 != nil {
        if node1 === node2 {
            return node1
        }

        node1 = node1!.next
        node2 = node2!.next
    }

    return nil
}

func isCommonNodes<T>(_ head1: LinkedListNode<T>, _ head2: LinkedListNode<T>) -> LinkedListNode<T>? {
    let length1 = listLength(head1)
    let length2 = listLength(head2)

    if length1 == length2 {
        return containNodes(head1: head1, head2: head2, offset: 0)
    } else if length1 > length2 {
        return containNodes(head1: head1, head2: head2, offset: length1 - length2)
    } else {
        return containNodes(head1: head2, head2: head1, offset: length2 - length1)
    }
}

let input1: (LinkedListNode<Int>, LinkedListNode<Int>, LinkedListNode<Int>?) = {
    let commonList = LinkedListNode(0, 1, 2, 3)
    let list1 = LinkedListNode(5, 1)
    list1.appendToTail(commonList)

    let list2 = LinkedListNode(3)
    list2.appendToTail(commonList)

    return (list1, list2, commonList)
}()

let input2: (LinkedListNode<Int>, LinkedListNode<Int>, LinkedListNode<Int>?) = {
    let list1 = LinkedListNode(5, 1)
    let list2 = LinkedListNode(3)

    return (list1, list2, nil)
}()

let input3: (LinkedListNode<Int>, LinkedListNode<Int>, LinkedListNode<Int>?) = {
    let commonList = LinkedListNode(0, 1, 2, 3)
    let list1 = LinkedListNode(1)
    list1.appendToTail(commonList)

    let list2 = LinkedListNode(3)
    list2.appendToTail(commonList)

    return (list1, list2, commonList)
}()

let inputs = [
    input1,
    input2,
    input3,
]


for input in inputs {
    let result = isCommonNodes(input.0, input.1)
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
