import Foundation

func getBit(value: Int64, bit: Int) -> Bool {
    (value & (1 << bit)) != 0
}

func maxStreak(value: Int64) -> Int {
    var current = 0 // current "1" streak without "0" reverse
    var buffer = 0  // previous "1" streak without "0" reverse
    var result = 0  // maximum "1" streak with "0" reverse

    for bit in 0..<64 {
        if getBit(value: value, bit: bit) {
            // increment current "1" streak
            current += 1
        } else {
            // found "0"
            result = max(result, current + buffer + 1)
            buffer = current
            current = 0
        }
    }

    return max(result, current + buffer + 1)
}

let inputs: [(Int64, Int)] = [
    (1775, 8),  // 1101110111
    (475, 6),   // 111011011
    (115, 4),   // 1110011
]


for input in inputs {
    let result = maxStreak(value: input.0)
    print("value: \(result), result: \(result == input.1 ? "OK" : "NG")\n")
}
