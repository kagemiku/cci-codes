import Foundation

func calcMultiply(x: Int, y: Int, memo: inout [Int: Int]) -> Int {
    if x == 1 {
        return y
    }

    if let value = memo[x] {
        return value
    }

    let pivot = x / 2
    let ans = calcMultiply(x: pivot, y: y, memo: &memo) + calcMultiply(x: x - pivot, y: y, memo: &memo)
    memo[x] = ans

    return ans
}

let inputs: [(x: Int, y: Int, ans: Int)] = [
    (x: 5, y: 4, ans: 20),
    (x: 1, y: 4, ans: 4),
    (x: 100, y: 100, ans: 10000),
]

for input in inputs {
    var memo = [Int: Int]()
    let result = calcMultiply(x: input.x, y: input.y, memo: &memo)
    print(result, result == input.ans)
}
