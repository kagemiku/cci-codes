import Foundation

func isConnected(graph: MyGraph, from: Int, to: Int) -> Bool {
    var q = [Int]()
    var visited = Set<Int>()

    visited.insert(from)
    q.append(from)

    while !q.isEmpty {
        let node = q.removeFirst()
        if node == to {
            return true
        }

        for next in graph.nodes[node]! {
            if !visited.contains(next) {
                visited.insert(next)
                q.append(next)
            }
        }
    }

    return false
}

class MyGraph {
    let nodes: [Int: [Int]]

    init(nodes: [Int: [Int]]) {
        self.nodes = nodes
    }
}

let graph = MyGraph(
    nodes: [
        0: [1, 4, 5],
        1: [3, 4],
        2: [1],
        3: [2, 4],
        4: [],
        5: [],
    ]
)

let inputs = [
    (0, 4, true),
    (0, 2, true),
    (0, 3, true),
    (4, 0, false),
]

for input in inputs {
    let result = isConnected(graph: graph, from: input.0, to: input.1)
    let expected = input.2
    print(result == expected ? "OK" : "NG")
}
