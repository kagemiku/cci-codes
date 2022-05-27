import Foundation

/*
 S: String, N: S.count

 Perm(N) = ""
 Perm(i) = T.inserted(S[i], at: j) where T: Perm(i + 1), 0 <= j <= T.count
 */
func generatePerms(_ s: [Character], start: Int) -> [String] {
    if start == s.count {
        return [""]
    }

    return generatePerms(s, start: start + 1).flatMap { str -> [String] in
        var tempResult = [String]()
        for index in 0 ... str.count {
            var tempStr = Array(str)
            tempStr.insert(s[start], at: index)
            tempResult.append(String(tempStr))
        }

        return tempResult
    }
}

let inputs: [String] = [
    "a",
    "ab",
    "abc",
    "abcd",
]

for input in inputs {
    let ans = generatePerms(Array(input), start: 0)
    print("\(input): \n\(ans.sorted())\n")
}

