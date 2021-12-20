import Foundation

func canExpressAsBinary(_ value: Double) -> Bool {
    var value = value
    var bits = [Int]()

    while value != 0 {
        value *= 2
        if value >= 1 {
            bits.append(1)
            value -= 1
        } else {
            bits.append(0)
        }

        if bits.count > 32 {
            return false
        }
    }

    print(bits)

    return true
}

let inputs: [(Double, Bool)] = [
    (0.5, true),
    (0.125, true),
    (0.625, true),
    (0.875, true),
    (0.333, false),
    (0.9, false),
]


for input in inputs {
    let result = canExpressAsBinary(input.0)
    print("value: \(result), result: \(result == input.1 ? "OK" : "NG")\n")
}
