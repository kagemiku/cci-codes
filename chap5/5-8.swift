import Foundation

func drawLine(screen: inout [UInt8], width: Int, x1: Int, x2: Int, y: Int) {
    let startIndex = (width / 8) * y + (x1 / 8)
    let lastIndex = (width / 8) * y + (x2 / 8)

    for index in startIndex...lastIndex {
        let offset = index * 8
        var value: UInt8 = 0
        for bit in 0..<8 {
            let currentBit = (offset + bit) % width
            if x1 <= currentBit && currentBit <= x2 {
                value |= 1 << (7 - bit)
            }
        }

        screen[index] = value
    }
}

func printScreen(_ screen: [UInt8], width: Int) {
    var columnIndex = 0
    for row in screen {
        for bit in (0..<8).reversed() {
            if (row & (1 << bit)) != 0 {
                print("*", terminator: "")
            } else {
                print("-", terminator: "")
            }
        }

        columnIndex += 8
        if columnIndex >= width {
            columnIndex = 0
            print("\n")
        }
    }
}

// width, x1, x2, y
let inputs: [(Int, Int, Int, Int)] = [
    (8, 1, 6, 0),
    (24, 1, 22, 1),
    (32, 17, 19, 2),
]


// printScreen([0, 7, 0, 7, 0, 2], width: 24)
for input in inputs {
    print("width: \(input.0), (\(input.1), \(input.3)) -> (\(input.2), \(input.3))")
    var screen: [UInt8] = Array(repeating: 0, count: input.0 / 8 * 3)
    drawLine(screen: &screen, width: input.0, x1: input.1, x2: input.2, y: input.3)
    printScreen(screen, width: input.0)
    print("\n")
}
