import Foundation

struct ImpossibleError: Error {}

func getBottomNodes(_ graph: MyGraph<Character>, _ exists: [Character]) -> [Character] {
    graph.nodes.keys.filter {
        graph.nodes[$0]!.count == 0 && !exists.contains($0)
    }
}

func removeNodes(_ graph: MyGraph<Character>, nodes: [Character]) {
    for key in graph.nodes.keys {
        graph.nodes[key]! = graph.nodes[key]!.filter({ !nodes.contains($0) })
    }
}

func calculateOrder(_ graph: MyGraph<Character>) throws -> [Character] {
    var result = [Character]()
    while result.count < graph.nodes.count {
        let bottomNodes = getBottomNodes(graph, result)
        if bottomNodes.isEmpty {
            throw ImpossibleError()
        }

        result.append(contentsOf: bottomNodes)
        removeNodes(graph, nodes: bottomNodes)
    }

    return result
}

class MyGraph<T: Hashable> {
    var nodes: [T: [T]]

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
