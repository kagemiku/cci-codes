import Foundation

struct Box: CustomStringConvertible {
    var wi: Int
    var hi: Int
    var di: Int

    var description: String {
        "(\(wi), \(hi), \(di))"
    }

    func isSmallerThan(_ other: Box) -> Bool {
        wi < other.wi && hi < other.hi && di < other.di
    }
}

func calcMaxHight(sortedBoxes: [Box], index: Int, hight: Int, current: [Box]) -> (Int, [Box]) {
    guard index < sortedBoxes.count else {
        return (hight, current)
    }

    // sortedBoxes[index] is not stacked (skipped)
    var result = calcMaxHight(sortedBoxes: sortedBoxes, index: index + 1, hight: hight, current: current)

    // sortedBoxes[index] is stacked
    if current.isEmpty || sortedBoxes[index].isSmallerThan(current.last!) {
        let usedResult = calcMaxHight(
            sortedBoxes: sortedBoxes,
            index: index + 1,
            hight: hight + sortedBoxes[index].hi,
            current: current + [sortedBoxes[index]]
        )

        result = (usedResult.0 > result.0) ? usedResult : result
    }

    return result
}

func calcMaxHight(boxes: [Box]) -> (Int, [Box]) {
    let sortedBoxesList: [[Box]] = [
        boxes.sorted { $0.wi > $1.wi },
        boxes.sorted { $0.hi > $1.hi },
        boxes.sorted { $0.di > $1.di },
    ]

    var result: (Int, [Box]) = (-1, [])
    for sortedBoxes in sortedBoxesList {
        let r = calcMaxHight(sortedBoxes: sortedBoxes, index: 0, hight: 0, current: [])
        if r.0 > result.0 {
            result = r
        }
    }

    return result
}

let input1: [Box] = [
    Box(wi: 1, hi: 1, di: 1),
    Box(wi: 2, hi: 2, di: 2),
    Box(wi: 3, hi: 3, di: 3),
    Box(wi: 4, hi: 4, di: 4),
]

let input2: [Box] = [
    Box(wi: 1, hi: 1, di: 1),
    Box(wi: 2, hi: 2, di: 2),
    Box(wi: 3, hi: 3, di: 3),
    Box(wi: 1, hi: 1000, di: 1),
]

let input3: [Box] = [
    Box(wi: 1000, hi: 1, di: 1),
    Box(wi: 1, hi: 1000, di: 1),
    Box(wi: 1, hi: 1, di: 1000),
]

let input4: [Box] = [
    Box(wi: 3, hi: 60, di: 3),
    Box(wi: 2, hi: 40, di: 2),
    Box(wi: 2, hi: 100, di: 2),
    Box(wi: 1, hi: 1, di: 1),
]

let inputs: [[Box]] = [
    input1,
    input2,
    input3,
    input4,
]

for input in inputs {
    let result = calcMaxHight(boxes: input)
    print("hight: \(result.0), order: \(result.1)")
}

