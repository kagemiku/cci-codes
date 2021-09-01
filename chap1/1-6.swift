func compress(_ string: String) -> String {
    let arr = Array(string)
    var current = arr[0]
    var count = 0
    var result = [String]()
    for char in arr {
        if char != current {
            result.append(String(current))
            result.append(String(count))
            count = 0
            current = char
        }

        count += 1
    }

    result.append(String(current))
    result.append(String(count))

    let ret = result.joined()

    return ret.count > string.count ? string : ret
}


let inputs = [
    ("aabcccccaaa", "a2b1c5a3"),
    ("a", "a"),
    ("ab", "ab"),
    ("aaaaaa", "a6"),
]

for input in inputs {
    let result = compress(input.0)
    let expected = input.1
    let ok = result == expected
    print("result: \(result), expected: \(expected) => \(ok ? "OK" : "NG")")
}

