func countChars(_ arr: [Character]) -> [Character: Int] {
    var dict = [Character: Int]()
    arr.forEach { char in
        dict[char, default: 0] += 1
    }

    return dict
}

func isPalindrome(_ str: String) -> Bool {
    let arr = Array(str.lowercased()).filter { $0 != " " }
    let dict = countChars(arr)

    var oddExist = false
    for val in dict.values {
        if !val.isMultiple(of: 2) {
            if oddExist {
                return false
            }
            oddExist = true
        }
    }

    return true
}

let inputs = [
    ("Tact Coa", true),
    ("aaaaaa", true),
    ("ab", false),
    ("aaab", false),
]

for input in inputs {
    let result = isPalindrome(input.0)
    let expected = input.1
    let ok = result == expected
    print("result: \(result), expected: \(expected) => \(ok ? "OK" : "NG")")
}

