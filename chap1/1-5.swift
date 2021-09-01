// arr1.count < arr2.count
func isSimilarArray(_ arr1: [Character], _ arr2: [Character]) -> Bool {
    var inserted = false
    var idx = 0
    for char in arr1 {
        if char != arr2[idx] {
            if inserted || char != arr2[idx+1]{
                return false
            }
            inserted = true
            idx += 1
        }
        idx += 1
    }

    return true
}

func isSimilarString(_ str1: String, _ str2: String) -> Bool {
    guard str1 != str2 else {
        return true
    }

    guard abs(str1.count - str2.count) <= 1 else {
        return false
    }

    let arr1 = Array(str1)
    let arr2 = Array(str2)
    if arr1.count == arr2.count {
        var diff = false
        for (char1, char2) in zip(arr1, arr2) {
            if char1 != char2 {
                if diff {
                    return false
                }
                diff = true
            }
        }

        return true
    } else if arr1.count < arr2.count {
        return isSimilarArray(arr1, arr2)
    } else {
        return isSimilarArray(arr2, arr1)
    }
}

let inputs = [
    ("pale", "ple", true),
    ("pales", "pale", true),
    ("pale", "bale", true),
    ("pale", "bake", false),
]

for input in inputs {
    let result = isSimilarString(input.0, input.1)
    let expected = input.2
    let ok = result == expected
    print("result: \(result), expected: \(expected) => \(ok ? "OK" : "NG")")
}

