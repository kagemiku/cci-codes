import Foundation

func bitDistance(a: Int, b: Int) -> Int {
    var diff = a ^ b
    var distance = 0

    while diff != 0 {
        if diff & 1 == 1 {
            distance += 1
        }

        diff >>= 1
    }

    return distance
}


let inputs: [(Int, Int, Int)] = [
    (0b11101, 0b01111, 2),
    (0b00000, 0b11111, 5),
    (0b11111, 0b11111, 0),
    (0b10101, 0b01010, 5),
]


for input in inputs {
    let result = bitDistance(a: input.0, b: input.1)
    print("value: \(result), result: \(result == input.2 ? "OK" : "NG")\n")
}
