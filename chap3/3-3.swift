import Foundation

final class SetOfStacks<T> {
    private let limit: Int
    private var stacks = [[T]]()

    init(limit: Int) {
        self.limit = limit
    }

    @discardableResult
    func pop() -> T {
        guard var stack = stacks.last, let value = stack.last else {
            fatalError("Stack is empty")
        }

        stack.removeLast()
        stacks[stacks.count - 1] = stack

        if stack.isEmpty {
            stacks.removeLast()
        }

        return value
    }

    @discardableResult
    func pop(at index: Int) -> T {
        guard index < stacks.count else {
            fatalError("Index is out of range")
        }

        guard let value = stacks[index].last else {
            fatalError("Stack[\(index)] is empty")
        }

        var stack = stacks[index]
        stack.removeLast()
        stacks[index] = stack

        return value
    }

    func push(item: T) {
        if isEmpty() {
            stacks.append([T]())
        }

        if let count = stacks.last?.count, count >= limit {
            stacks.append([T]())
        }

        var stack = stacks[stacks.count - 1]
        stack.append(item)
        stacks[stacks.count - 1] = stack
    }

    func peek() -> T {
        guard let value = stacks.last?.last else {
            fatalError("Stack is empty")
        }

        return value
    }

    func isEmpty() -> Bool {
        stacks.isEmpty
    }
}

/// normal
print("--- normal ---")
let stacks = SetOfStacks<Int>(limit: 3)
print(stacks.isEmpty())

stacks.push(item: 0)
stacks.push(item: 1)
stacks.push(item: 2)
print(stacks.peek())

stacks.push(item: 3)
stacks.push(item: 4)
print(stacks.peek())

print(stacks.pop())
print(stacks.pop())
print(stacks.pop())
print(stacks.pop())
print(stacks.pop())
print(stacks.isEmpty())

/// advanced
print("--- advanced ---")
let stacks2 = SetOfStacks<Int>(limit: 2)
stacks2.push(item: 0)
stacks2.push(item: 1)
stacks2.push(item: 2)
stacks2.push(item: 3)
stacks2.push(item: 4)

print(stacks2.pop(at: 1))
print(stacks2.peek())

print(stacks2.pop())
print(stacks2.peek())
