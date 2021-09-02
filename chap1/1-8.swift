func zerofill(_ image: [[Int]]) -> [[Int]] {
    var rowZero = Array(repeating: false, count: image.count)
    var colZero = Array(repeating: false, count: image[0].count)

    for row in 0 ..< image.count {
        for col in 0 ..< image[row].count {
            if image[row][col] == 0 {
                rowZero[row] = true
                colZero[col] = true
            }
        }
    }

    var result = image
    for row in 0 ..< image.count {
        for col in 0 ..< image[row].count {
            if rowZero[row] || colZero[col] {
                result[row][col] = 0
            }
        }
    }

    return result
}

let input0 = [
    [0, 1],
    [2, 3],
]

let input1 = [
    [0, 1, 2, 3],
    [4, 5, 6, 7],
    [8, 9, 0, 1],
]

let output0 = [
    [0, 0],
    [0, 3],
]

let output1 = [
    [0, 0, 0, 0],
    [0, 5, 0, 7],
    [0, 0, 0, 0],
]

let inputs = [
    (input0, output0),
    (input1, output1),
]

for input in inputs {
    let result = zerofill(input.0)
    let expected = input.1
    let ok = result == expected
    print("result: \(result), expected: \(expected) => \(ok ? "OK" : "NG")")
}

