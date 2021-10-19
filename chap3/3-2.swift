import Foundation

final class MinStack<T: Comparable> {
    private class StackNode {
        let value: T
        let minValue: T
        var next: StackNode?

        init(value: T, minValue: T) {
            self.value = value
            self.minValue = minValue
        }
    }

    private var top: StackNode?

    init() {}

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
            top = StackNode(value: item, minValue: item)
        } else {
            let newNode = StackNode(value: item, minValue: Swift.min(item, top!.minValue))
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

    func min() -> T {
        guard !isEmpty() else {
            fatalError("Stack is empty")
        }

        return top!.minValue
    }
}

let stack = MinStack<Int>()
stack.push(item: 10)
print(stack.min())

stack.push(item: 11)
print(stack.min())

stack.push(item: 5)
print(stack.min())

stack.push(item: 0)
print(stack.min())

stack.pop()
print(stack.min())

stack.pop()
print(stack.min())
