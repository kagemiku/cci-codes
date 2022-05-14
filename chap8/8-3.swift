import Foundation

/*
 [-1, 0, 1, 2, 4, 6, 8] => i = 4
 */
func findMagicIndex(_ arr: [Int]) -> Int {
    var begin = 0
    var end = arr.count - 1
    while begin <= end {
        let mid = (begin + end) / 2
        if arr[mid] == mid {
            return mid
        } else if arr[mid] < mid {
            begin = mid + 1
        } else {
            end = mid - 1
        }
    }

    return -1
}

let inputs: [(arr: [Int], ans: Int)] = [
    (arr: [-1, 0, 1, 2, 4, 6, 8], ans: 4),
    (arr: [-100, 1, 5], ans: 1),
    (arr: [-100, -10, -1, 0, 1, 5], ans: 5),
    (arr: [0, 10, 100, 1000], ans: 0),
]

for input in inputs {
    let result = findMagicIndex(input.arr)
    print(result, result == input.ans)
}

