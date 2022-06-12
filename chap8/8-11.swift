import Foundation

func calcCombs(n: Int, coins: [Int], index: Int, memo: inout [[Int?]]) -> Int {
    if index >= coins.count - 1 {
        return 1
    }

    if let value = memo[n][index] {
        return value
    }

    var result = 0
    let coin = coins[index]
    let count = n / coin
    for i in 0 ... count {
        result += calcCombs(n: n - coin * i, coins: coins, index: index + 1, memo: &memo)
    }

    memo[n][index] = result

    return result
}

let inputs = [
    1,      // 1
    5,      // 2
    10,     // 4
    25,
]

for input in inputs {
    var memo = Array(repeating: Array(repeating: Optional<Int>.none, count: 4), count: input + 1)
    let result = calcCombs(n: input, coins: [25, 10, 5, 1], index: 0, memo: &memo)
    print("\(input): \(result)\n")
}
