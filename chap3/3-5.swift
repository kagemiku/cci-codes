import Foundation

func sortStack(_ stack: MyStack<Int>) {
    let sub = MyStack<Int>()
    var minValue = Int.max

    while !stack.isEmpty() {
        let value = stack.pop()
        minValue = min(minValue, value)
        sub.push(item: value)
    }

    while !sub.isEmpty() {
        let value = sub.pop()
        if value != minValue {
            stack.push(item: value)
        }
    }

    stack.push(item: minValue)
}

final class MyStack<T>: CustomStringConvertible {
    private class StackNode {
        let value: T
        var next: StackNode?

        init(value: T) {
            self.value = value
        }
    }

    private var top: StackNode?

    init() {}

    init(values: T...) {
        for value in values {
            push(item: value)
        }
    }

    @discardableResult
    func pop() -> T {
        guard !isEmpty() else {
            fatalError("Stack is empty")
        }

        let value = top!.value
        top = top!.next

        return value
    }

    func push(item: T) {
        if isEmpty() {
            top = StackNode(value: item)
        } else {
            let newNode = StackNode(value: item)
            newNode.next = top
            top = newNode
        }
    }

    func peek() -> T {
        guard !isEmpty() else {
            fatalError("Stack is empty")
        }

        return top!.value
    }

    func isEmpty() -> Bool {
        top == nil
    }

    var description: String {
        var values = [T]()
        var node: StackNode? = top
        while node != nil {
            values.append(node!.value)
            node = node!.next
        }

        return values.reversed().description
    }
}

let inputs = [
    MyStack(values: 3, 2, 1, 0),
    MyStack(values: 0, 1, 2, 3),
    MyStack(values: 3, 1, 0, 2),
]

for input in inputs {
    sortStack(input)
    print(input)
}
