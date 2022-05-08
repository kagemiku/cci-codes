import Foundation

/*
 S(0) = 1
 S(n) = S(n - 1) + S(n - 2) + S(n - 3)
 */
func countSteps(n: Int) -> Int {
    guard n > 0 else {
        return 0
    }

    var dp = Array(repeating: 0, count: n + 1)
    dp[0] = 1

    for i in 1 ... n {
        dp[i] = dp[i - 1]
        if i > 1 {
            dp[i] += dp[i - 2]
        }
        if i > 2 {
            dp[i] += dp[i - 3]
        }
    }

    return dp[n]
}

let inputs = [
    1,
    2,
    3,
    4,
    5,
    6,
    10,
]

for input in inputs {
    print(countSteps(n: input))
}
