import Foundation

struct Piece {
    // should be 4 elements
    let edges: [Int?]
}

extension Piece {
    var isSide: Bool {
        edges.compactMap { $0 }.count < 4
    }

    var isVertex: Bool {
        edges.compactMap { $0 }.count == 2
    }
}

func fitsWith(p1: Piece, p2: Piece) -> Bool {
    for edge in p1.edges {
        guard let edge = edge else {
            continue
        }

        if p2.edges.contains(edge) {
            return true
        }
    }

    return false
}

func solve(pieces: [Piece]) -> [[Piece]] {
    var vertexes = [Piece]()
    var sides = [Piece]()
    var insides = [Piece]()
    for piece in pieces {
        if piece.isVertex {
            vertexes.append(piece)
        } else if piece.isSide {
            sides.append(piece)
        } else {
            insides.append(piece)
        }
    }

    let n = pieces.count
    var result = Array(repeating: [Piece](), count: n)
    for row in 0 ..< n {
        for column in 0 ..< n {
            // skip vertix search
            if (row == 0 && column == 0)
                || (row == 0 && column == n - 1)
                || (row == n - 1 && column == 0)
                || (row == n - 1 && column == n - 1) {
                continue
            }

            // find correct piece one by one
        }
    }

    return result
}

