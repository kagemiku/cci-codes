import Foundation

/*
 n: 1 => ()
 n: 2 => (()), (), ()
 */
func generatePars(left: Int, right: Int, result: String) -> [String] {
    guard left >= 0 && right >= 0 && left <= right else {
        return []
    }

    if left == 0 && right == 0 {
        return [result]
    }

    return generatePars(left: left - 1, right: right, result: result + "(")
        + generatePars(left: left, right: right - 1, result: result + ")")
}


let inputs = [
    1,
    2,
    3,
    4,
    5,
]

for input in inputs {
    let result = generatePars(left: input, right: input, result: "")
    print("\(input): \(result)\n")
}
