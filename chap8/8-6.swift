import Foundation

enum Hanoi: String {
    case X
    case Y
    case Z

    init(int: Int) {
        switch int {
        case 0: self = .X
        case 1: self = .Y
        case 2: self = .Z
        default: fatalError()
        }
    }
}

func printCurrentHanoi(_ hanoi: [[Int]], maxHeight: Int) {
    for height in (0 ..< maxHeight).reversed() {
        var line = " "
        for index in (0 ..< 3) {
            if height <= hanoi[index].count - 1 {
                line.append(String(hanoi[index][height]))
            } else {
                line.append("|")
            }

            line.append("  ")
        }

        print(line)
    }

    print(" X  Y  Z\n---------\n")
}

/*
 1: 1:X -> 1:Y
 2: 1:X -> 1:Z, 2:X -> 2:Y, 1:Z -> 2:Y

 N:X -> N:Y = N-1:X -> N-1:Z, N:X -> N:Y, N-1:Z -> N:Y
 */
func solveHanoi(no: Int, from: Int, to: Int, hanoi: inout [[Int]], maxHeight: Int) {
    if hanoi[from].last! == no {
        hanoi[from].removeLast()
        hanoi[to].append(no)
        print("[\(no)] \(Hanoi(int: from).rawValue) -> \(Hanoi(int: to).rawValue)")
        printCurrentHanoi(hanoi, maxHeight: maxHeight)
        return
    }

    let tempNo = 3 - from - to
    let maxHeight = max(maxHeight, no)
    // move `no - 1` objects to temporal position
    solveHanoi(no: no - 1, from: from, to: tempNo, hanoi: &hanoi, maxHeight: maxHeight)

    // move `no` object to target position
    solveHanoi(no: no, from: from, to: to, hanoi: &hanoi, maxHeight: maxHeight)

    // move `no - 1` objects from temporal position to target position
    solveHanoi(no: no - 1, from: tempNo, to: to, hanoi: &hanoi, maxHeight: maxHeight)
}

let inputs: [Int] = [
    1,
    2,
    3,
    4,
    5,
//    10
]

for input in inputs {
    print("\n--- input: \(input) ---")
    var hanoi = Array(repeating: [Int](), count: 3)
    hanoi[0] = (1...input).reversed().map { $0 }
    printCurrentHanoi(hanoi, maxHeight: input)
    solveHanoi(no: input, from: 0, to: 1, hanoi: &hanoi, maxHeight: input)
}
