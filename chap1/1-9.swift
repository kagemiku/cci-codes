import Foundation

func isRotated(_ str1: String, _ str2: String) -> Bool {
    guard str1.count == str2.count else {
        return false
    }

    return (str2 + str2).contains(str1)
}

let inputs = [
    ("waterbottle", "erbottlewat", true),
    ("waterbottle", "hoge", false),
    ("waterbottle", "erbottlewa", false),
]

for input in inputs {
    let result = isRotated(input.0, input.1)
    let expected = input.2
    let ok = result == expected
    print("result: \(result), expected: \(expected) => \(ok ? "OK" : "NG")")
}

