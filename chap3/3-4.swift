import Foundation

final class MyQueue<T> {
    private let stack = MyStack<T>()
    private let sub = MyStack<T>()

    func add(item: T) {
        stack.push(item: item)
    }

    @discardableResult
    func remove() -> T {
        moveItems(from: stack, to: sub)

        let value = sub.pop()
        moveItems(from: sub, to: stack)

        return value
    }

    func peek() -> T {
        moveItems(from: stack, to: sub)

        let value = sub.peek()
        moveItems(from: sub, to: stack)

        return value
    }

    func isEmpty() -> Bool {
        stack.isEmpty()
    }

    private func moveItems(from: MyStack<T>, to: MyStack<T>) {
        while !from.isEmpty() {
            to.push(item: from.pop())
        }
    }
}

final class MyStack<T> {
    private class StackNode {
        let value: T
        var next: StackNode?

        init(value: T) {
            self.value = value
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
}

let queue = MyQueue<Int>()

print(queue.isEmpty())

queue.add(item: 0)
queue.add(item: 1)
queue.add(item: 2)

print(queue.peek())
print(queue.remove())

print(queue.peek())
print(queue.remove())

print(queue.peek())
