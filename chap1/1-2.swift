func isReorderedStrings(_ str1: String, _ str2: String) -> Bool {
    let arr1 = Array(str1)
    let arr2 = Array(str2)
    guard arr1.count == arr2.count else {
        return false
    }

    var dict = [Character: Int]()
    zip(arr1, arr2).forEach { (char1, char2) in
        dict[char1, default: 0] += 1
        dict[char2, default: 0] += 1
    }
    let count = dict.values.filter { value in
        value != 2
    }
    .count

    return count == 0
}

let inputs = [
    ("hoge", "egoh", true),
    ("hoge", "fuga", false),
    ("hoge", "hoge", true),
    ("hoge", "oheg", true),
]

for input in inputs {
    let result = isReorderedStrings(input.0, input.1)
    let expected = input.2
    let ok = result == expected
    print("result: \(result), expected: \(expected) => \(ok ? "OK" : "NG")")
}

