func replaceWhitespaces(_ str: String) -> String {
    let arr = Array(str)
    var newArr = [String]()

    for char in arr {
        if char == " " {
            newArr.append("%20")
        } else {
            newArr.append(String(char))
        }
    }

    return newArr.joined()
}

let inputs = [
    ("Mr John Smith", "Mr%20John%20Smith"),
    ("This is a pen ", "This%20is%20a%20pen%20"),
]

for input in inputs {
    let result = replaceWhitespaces(input.0)
    let expected = input.1
    let ok = result == expected
    print("result: \(result), expected: \(expected) => \(ok ? "OK" : "NG")")
}

