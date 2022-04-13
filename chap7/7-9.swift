import Foundation

struct CircularArray<Element: CustomStringConvertible>: Sequence, CustomStringConvertible {
    // for `for value in circularArray { ... }`
    struct Iterator: IteratorProtocol {
        private let base: CircularArray<Element>
        private var index: Int

        init(base: CircularArray<Element>) {
            self.base = base
            self.index = 0
        }

        mutating func next() -> Element?? {
            guard index < base.count else {
                return nil
            }

            let value = base[index]
            index += 1

            return value
        }
    }

    private var array: Array<Element?>
    private var beginIndex: Int
    private var endIndex: Int

    var count: Int {
        array.count
    }

    // for debug string
    var description: String {
        var arr = [String]()
        for n in 0 ..< count {
            if let value = self[n] {
                arr.append(value.description)
            } else {
                arr.append("nil")
            }
        }

        return arr.joined(separator: ", ")
    }

    init(capacity: Int) {
        self.array = Array(repeating: nil, count: capacity)
        self.beginIndex = 0
        self.endIndex = self.array.count - 1
    }

    // for circularArray[n] access
    subscript(index: Int) -> Element? {
        get {
            get(at: index)
        }
        set {
            insert(value: newValue, at: index)
        }
    }

    mutating func insert(value: Element?, at: Int) {
        guard at >= 0 && at < array.count else {
            fatalError("Index out of range")
        }

        let index = (beginIndex + at) % array.count
        array[index] = value
    }

    func get(at: Int) -> Element? {
        guard at >= 0 && at < array.count else {
            fatalError("Index out of range")
        }

        let index = (beginIndex + at) % array.count
        return array[index]
    }

    mutating func rotate(_ count: Int) {
        beginIndex = (beginIndex + count) % array.count
        endIndex = (endIndex + count) % array.count

        if beginIndex < 0 {
            beginIndex += array.count
        }
        if endIndex < 0 {
            endIndex += array.count
        }
    }

    func makeIterator() -> Iterator {
        Iterator(base: self)
    }
}

var circularArray = CircularArray<Int>(capacity: 10)
for n in 0 ..< circularArray.count / 2 {
    circularArray[n] = n * 10
}
print(circularArray)

for n in 0 ..< circularArray.count {
    circularArray.rotate(n)
    print("Rotated \(n): \(circularArray)")
}

for n in 0 ..< circularArray.count {
    circularArray.rotate(-n)
    print("Rotated \(-n): \(circularArray)")
}

for value in circularArray {
    print(value)
}
