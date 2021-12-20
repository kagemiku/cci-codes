import Foundation

func insertBits(n: UInt32, m: UInt32, i: Int, j: Int) -> UInt32 {
    // i: 1, j: 3 => 0b01000 => 0b00111 => 0b01110
    let mask: UInt32 = ((1 << (j - i + 1)) - 1) << i

    // m: 0b00111, i: 1 => 0b01110
    let inserting: UInt32 = m << i

    // n: 0b10010, mask: 0b01110, inserting: 0b01110
    //    => 0b10000 => 0b11110
    return n & ~mask | inserting
}

let inputs: [(UInt32, UInt32, Int, Int, UInt32)] = [
    (0b10000000000, 0b10011, 2, 6, 0b10001001100),
    (0b100000, 0b111, 1, 3, 0b101110),
]


for input in inputs {
    let result = insertBits(n: input.0, m: input.1, i: input.2, j: input.3)
    print("value: \(String(result, radix: 2)), result: \(result == input.4 ? "OK" : "NG")")
}
