import Foundation

func swapBits(_ input: UInt) -> UInt {
    let evenMask: UInt = 0x5555555555555555 // 0101 0101...
    let oddMask: UInt  = 0xAAAAAAAAAAAAAAAA // 1010 1010...

    let evenBits = input & evenMask
    let oddBits = input & oddMask

    return (evenBits << 1) | (oddBits >> 1)
}

let inputs: [(UInt, UInt)] = [
    (0b00110110, 0b00111001),
    (0b10100110, 0b01011001),
]


for input in inputs {
    let result = swapBits(input.0)
    print("value: \(result), result: \(result == input.1 ? "OK" : "NG")\n")
}
