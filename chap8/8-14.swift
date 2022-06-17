import Foundation

/*
 1^0|0|1, false =>
    1, ^, 0|0|1 =>
        0, |, 0|1  =>
            0, |, 1
 */
func countPatterns(expr: String, eval: Bool) -> Int {
    0
}

let inputs: [(expr: String, eval: Bool)] = [
    (expr: "1^0|0|1", eval: false),     // 2
    (expr: "0&0&0&1^1|0", eval: true),  // 10
]

for input in inputs {
    let result = countPatterns(expr: input.expr, eval: input.eval)
    print("\(input.expr), \(input.eval) => \(result)")
}
