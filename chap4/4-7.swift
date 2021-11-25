import Foundation

struct ImpossibleError: Error {}

func calculateOrder(_ graph: MyGraph<Character>) throws -> [Character] {
    var result = [Character]()
    for node in graph.nodes.keys {
        guard !result.contains(node) else {
            continue
        }

        var partialResult = [node]
        var q = [node]
        while !q.isEmpty {
            let front = q.first!
            for nextNode in graph.nodes[front]! {
                if !result.contains(nextNode) && !partialResult.contains(nextNode) {
                    partialResult.append(nextNode)
                    q.append(nextNode)
                }
            }
            q.remove(at: 0)
        }

        result += partialResult.reversed()
    }

    return result
}

class MyGraph<T: Hashable> {
    let nodes: [T: [T]]

    init(nodes: [T: [T]]) {
        self.nodes = nodes
    }
}

let graph1 = MyGraph<Character>(
    nodes: [
        "a": ["f"],
        "b": ["f"],
        "c": ["d"],
        "d": ["a", "b"],
        "e": [],
        "f": [],
    ]
)

let graph2 = MyGraph<Character>(
    nodes: [
        "a": ["f"],
        "b": ["d"],
        "c": ["d"],
        "d": ["a"],
        "e": [],
        "f": ["b"],
    ]
)

do {
    try print(calculateOrder(graph1))
} catch {
    print(error)
}

print("\n")

do {
    try print(calculateOrder(graph2))
} catch {
    print(error)
}
