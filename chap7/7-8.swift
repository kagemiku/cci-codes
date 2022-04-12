import Foundation

enum Stone {
    case white
    case black
}

class Board {
    private(set) var stones: [[Stone?]]

    var isFilled: Bool {
        for row in stones {
            if row.contains(where: { $0 == nil }) {
                return true
            }
        }

        return false
    }

    init() {
        self.stones = Array(repeating: Array(repeating: nil, count: 8), count: 8)
        stones[3][3] = .black
        stones[4][4] = .black
        stones[3][4] = .white
        stones[4][3] = .white
    }

    func put(_ stone: Stone, row: Int, col: Int) -> Bool {
        guard 0 <= row && row < 8 && 0 <= col && col < 8 else {
            return false
        }

        return false
    }

    private func reverse(with: Stone, row: Int, col: Int) -> Bool {
        // implement reversing logics
        true
    }
}

class Score {
    private let board: Board
    private(set) var white = 0
    private(set) var black = 0

    init(board: Board) {
        self.board = board
    }

    func update() {
        white = 0
        black = 0

        for row in board.stones {
            for col in row {
                if col == .black {
                    black += 1
                } else {
                    white += 1
                }
            }
        }
    }
}

class Othello {
    private let board: Board
    private let score: Score
    private(set) var currentPlayer = Stone.black

    var isGameFinished: Bool {
        board.isFilled
    }

    init() {
        self.board = Board()
        self.score = Score(board: self.board)
    }

    func put(row: Int, col: Int) -> Bool {
        guard board.put(currentPlayer, row: row, col: col) else {
            return false
        }

        if currentPlayer == .black {
            currentPlayer = .white
        } else {
            currentPlayer = .black
        }
        score.update()

        return true
    }

    func calculateScore() -> (Int, Int) {
        score.update()
        return (score.black, score.white)
    }
}

