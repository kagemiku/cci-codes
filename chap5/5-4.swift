import Foundation

func getBit(value: Int, bit: Int) -> Bool {
    (value & (1 << bit)) != 0
}

func nextAndPrev(value: Int) -> (Int, Int) {
    var foundOne = false
    var foundZero = false
    var next = 0
    var prev = 0

    for bit in 0..<64 {
        if getBit(value: value, bit: bit) {
            foundOne = true
            if foundZero && prev == 0 {
                // 1100 -> 1010 (swap bits at 1 and 2)
                prev = value - (1 << (bit - 1))
            }
        } else {
            foundZero = true
            if foundOne && next == 0 {
                // 0110 -> 1010 (swap bits at 2 and 3)
                next = value + (1 << (bit - 1))
            }
        }

        if prev != 0 && next != 0 {
            break
        }
    }

    return (next, prev)
}

let inputs: [(Int, Int, Int)] = [
    (0b1011, 0b1101, 0b0111),
    (0b01101100, 0b01110100, 0b01101010),
]


for input in inputs {
    let result = nextAndPrev(value: input.0)
    print("value: \(result), result: \(result.0 == input.1 && result.1 == input.2 ? "OK" : "NG")\n")
}
