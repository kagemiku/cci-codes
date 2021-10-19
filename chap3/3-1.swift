import Foundation

final class Stack3<T> {
    private var arr: Array<T?>
    private var tops = [0, 0, 0]
    private let stackSize: Int

    init(stackSize: Int) {
        self.arr = Array(repeating: nil, count: stackSize * 3)
        self.tops = [0, stackSize, stackSize * 2]
        self.stackSize = stackSize
    }

    func pop(stackNo: Int) {
        guard 0 ..< 3 ~= stackNo else {
            fatalError("stackNo should be in 0 ~ 2")
        }

        let index = tops[stackNo]
        guard arr[index] != nil else {
            fatalError("stack \(stackNo) is empty")
        }

        arr[index] = nil
        if index > stackNo * stackSize {
            tops[stackNo] = index - 1
        }
    }

    func push(stackNo: Int, item: T) {
        guard tops[stackNo] + 1 < (stackNo + 1) * stackSize else {
            fatalError("stack \(stackNo) is full")
        }

        let topValue = arr[tops[stackNo]]
        let index = topValue == nil ? tops[stackNo] : tops[stackNo] + 1
        arr[index] = item
        tops[stackNo] += topValue == nil ? 0 : 1
    }

    func peek(stackNo: Int) -> T {
        guard 0 ..< 3 ~= stackNo else {
            fatalError("stack \(stackNo) should be in 0 ~ 2")
        }

        guard let value = arr[tops[stackNo]] else {
            fatalError("stack \(stackNo) is empty")
        }

        return value
    }

    func isEmpty(stackNo: Int) -> Bool {
        guard 0 ..< 3 ~= stackNo else {
            fatalError("stack \(stackNo) should be in 0 ~ 2")
        }

        return arr[tops[stackNo]] == nil
    }

    func printAllStacks() {
        print(arr)
    }
}

let stack3 = Stack3<Int>(stackSize: 3)
stack3.printAllStacks()
print(stack3.isEmpty(stackNo: 0), stack3.isEmpty(stackNo: 1), stack3.isEmpty(stackNo: 2))

stack3.push(stackNo: 0, item: 0)
stack3.push(stackNo: 1, item: 3)
stack3.push(stackNo: 1, item: 4)
stack3.push(stackNo: 2, item: 6)
stack3.push(stackNo: 2, item: 7)
stack3.push(stackNo: 2, item: 8)

stack3.printAllStacks()
print(stack3.isEmpty(stackNo: 0), stack3.isEmpty(stackNo: 1), stack3.isEmpty(stackNo: 2))
print(stack3.peek(stackNo: 0), stack3.peek(stackNo: 1), stack3.peek(stackNo: 2))

stack3.pop(stackNo: 0)
stack3.pop(stackNo: 1)
stack3.pop(stackNo: 2)
stack3.pop(stackNo: 2)
stack3.pop(stackNo: 2)
stack3.printAllStacks()
print(stack3.isEmpty(stackNo: 0), stack3.isEmpty(stackNo: 1), stack3.isEmpty(stackNo: 2))
