import Foundation

func drawChess(_ board: [[Bool]], count: Int) {
    print("------------------ ::\(count)")
    for row in board {
        var rowString = "|"
        for column in row {
            rowString += (column ? "o" : " ") + "|"
        }
        print(rowString)
    }
}

func canPut(mask: Int, column: Int) -> Bool {
    let bit = (1 << (7 - column))
    return mask & bit == 0
}

func drawEightQueens(board: inout [[Bool]], row: Int, columnMask: Int, leftCrossMask: Int, rightCrossMask: Int, count: inout Int) {
    if row == 8 {
        drawChess(board, count: count)
        count += 1
        return
    }

    for column in 0 ..< 8 {
        guard canPut(mask: columnMask, column: column)
            && canPut(mask: leftCrossMask, column: column)
            && canPut(mask: rightCrossMask, column: column) else {
            continue
        }

        board[row][column] = true
        let bit = 1 << (7 - column)

        drawEightQueens(
            board: &board,
            row: row + 1,
            columnMask: columnMask | bit,
            leftCrossMask: (leftCrossMask | bit) << 1,
            rightCrossMask: (rightCrossMask | bit) >> 1,
            count: &count
        )

        board[row][column] = false
    }
}

var board = Array(repeating: Array(repeating: false, count: 8), count: 8)
var count = 1
drawEightQueens(board: &board, row: 0, columnMask: 0, leftCrossMask: 0, rightCrossMask: 0, count: &count)

