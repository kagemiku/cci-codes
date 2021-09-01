func rotate(_ image: [[Int]]) -> [[Int]] {
    var res = image
    let rows = image.count
    for n in 0 ..< rows/2 {
        let begin = n
        let end = rows - 1 - n
        for i in begin ..< end {
            let offset = i - begin
            let temp = res[begin][i]

            res[begin][i] = res[end - offset][begin]
            res[end - offset][begin] = res[end][end - offset]
            res[end][end - offset] = res[i][end]
            res[i][end] = temp
        }
    }

    return res
}

let input0 = [
    [0, 1],
    [2, 3],
]

let input1 = [
    [0, 1, 2, 3],
    [4, 5, 6, 7],
    [8, 9, 0, 1],
    [2, 3, 4, 5],
]

let output0 = [
    [2, 0],
    [3, 1],
]

let output1 = [
    [2, 8, 4, 0],
    [3, 9, 5, 1],
    [4, 0, 6, 2],
    [5, 1, 7, 3],
]

let inputs = [
    (input0, output0),
    (input1, output1),
]

for input in inputs {
    let result = rotate(input.0)
    let expected = input.1
    let ok = result == expected
    print("result: \(result), expected: \(expected) => \(ok ? "OK" : "NG")")
}

