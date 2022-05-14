import Foundation

func backtrack(_ arr: [Int], index: Int, result: [Int]) -> [[Int]] {
    if index == arr.count {
        return [result]
    }

    return backtrack(arr, index: index + 1, result: result)
        + backtrack(arr, index: index + 1, result: result + [arr[index]])
}

let inputs: [(arr: [Int], ans: Set<[Int]>)] = [
    (arr: [], ans: Set<[Int]>([[]])),
    (arr: [0], ans: Set<[Int]>([[], [0]])),
    (arr: [0, 1], ans: Set<[Int]>([[], [0], [1], [0, 1]])),
    (arr: [0, 1, 2], ans: Set<[Int]>([[], [0], [1], [2], [0, 1], [1, 2], [0, 2], [0, 1, 2]])),
]

for input in inputs {
    let result = backtrack(input.0, index: 0, result: [])
    print(result, Set(result) == input.ans)
}

