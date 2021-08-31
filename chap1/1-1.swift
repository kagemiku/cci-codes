func isUniqueString(_ str: String) -> Bool {
    let arr = Array(str)
    var dict = [Character: Int]()
    arr.forEach { char in
        dict[char, default: 0] += 1
    }

    let count = dict.values.filter { value in
        value > 1
    }
    .count

    return count == 0
}

let inputs = [
    ("hoge", true),
    ("test", false),
    ("aaaa", false),
    ("that", false),
]

for input in inputs {
    let result = isUniqueString(input.0)
    let expected = input.1
    let ok = result == expected
    print("result: \(result), expected: \(expected) => \(ok ? "OK" : "NG")")
}

