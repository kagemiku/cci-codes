import Foundation

final class CatDogQueue: CustomStringConvertible {
    enum Animal: String {
        case cat
        case dog
    }

    struct AnimalData: CustomStringConvertible {
        var animal: Animal
        var number: Int

        var description: String {
            "\(animal.rawValue)(\(number))"
        }
    }

    private class Node {
        let value: AnimalData
        var prev: Node?
        var next: Node?

        init(value: AnimalData) {
            self.value = value
        }
    }

    private var top: Node?
    private var last: Node?
    private var number = 0

    init() {}

    init(values: Animal...) {
        for value in values {
            enqueue(value)
        }
    }

    @discardableResult
    func dequeueAny() -> AnimalData {
        guard !isEmpty() else {
            fatalError("Stack is empty")
        }

        let value = top!.value
        top = top!.next
        top?.prev = nil
        if top == nil {
            last = nil
        }

        return value
    }

    @discardableResult
    func dequeueDog() -> AnimalData? {
        dequeueOf(.dog)
    }

    @discardableResult
    func dequeueCat() -> AnimalData? {
        dequeueOf(.cat)
    }

    private func dequeueOf(_ animal: Animal) -> AnimalData? {
        var node: Node? = top
        while node != nil {
            if node!.value.animal == animal {
                if node === top {
                    return dequeueAny()
                } else if node === last {
                    let result = last!.value
                    last = last!.prev
                    last!.next = nil

                    return result
                } else {
                    let result = node!.value
                    node!.prev!.next = node!.next
                    node!.next!.prev = node!.prev

                    return result
                }
            }

            node = node!.next
        }

        return nil
    }

    func enqueue(_ animal: Animal) {
        let data = AnimalData(animal: animal, number: number)

        if isEmpty() {
            top = Node(value: data)
            last = top
        } else {
            let newNode = Node(value: data)
            newNode.prev = last
            last!.next = newNode
            last = newNode
        }

        number += 1
    }

    func peek() -> AnimalData {
        guard !isEmpty() else {
            fatalError("Stack is empty")
        }

        return top!.value
    }

    func isEmpty() -> Bool {
        top == nil
    }

    var description: String {
        var values = [AnimalData]()
        var node: Node? = top
        while node != nil {
            values.append(node!.value)
            node = node!.next
        }

        return values.description
    }
}

let q = CatDogQueue(values: .cat, .cat, .dog, .dog, .cat)
print(q)

print(q.dequeueAny())
print(q)

print(q.dequeueDog())
print(q)

print(q.dequeueCat())
print(q)

print(q.dequeueCat())
print(q)

print(q.dequeueCat())
print(q.dequeueDog())
print(q)
