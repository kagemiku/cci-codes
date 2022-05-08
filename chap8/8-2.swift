import Foundation

struct Point: CustomStringConvertible, Hashable {
    let x: Int;
    let y: Int;

    var description: String {
        "(\(x),\(y))"
    }
}

func dfs(point: Point, prohibited: Set<Point>, route: [Point], memo: inout [Point: [Point]]) -> [Point] {
    // route found
    if point.x == 0 && point.y == 0 {
        return route
    }

    // cache found
    if let value = memo[point] {
        return value
    }

    var result = [Point]()

    // dfs with left route (from left to right)
    if point.x > 0 && !prohibited.contains(Point(x: point.x - 1, y: point.y)) {
        let newPoint = Point(x: point.x - 1, y: point.y)
        result = dfs(point: newPoint, prohibited: prohibited, route: [newPoint] + route, memo: &memo)
    }

    // dfs with above route (from top to down)
    if result.isEmpty && point.y > 0 && !prohibited.contains(Point(x: point.x, y: point.y - 1)) {
        let newPoint = Point(x: point.x, y: point.y - 1)
        result = dfs(point: newPoint, prohibited: prohibited, route: [newPoint] + route, memo: &memo)
    }

    return result
}

func findRoute(r: Int, c: Int, prohibited: [Point]) -> [Point] {
    var memo = [Point: [Point]]()
    let goal = Point(x: c - 1, y: r - 1)
    return dfs(point: goal, prohibited: Set(prohibited), route: [goal], memo: &memo)
}

let inputs: [(r: Int, c: Int, prohibited: [Point])] = [
    (r: 1, c: 4, prohibited: []),
    (r: 4, c: 1, prohibited: []),
    (r: 4, c: 4, prohibited: [Point(x: 2, y: 2)]),
    (r: 4, c: 4, prohibited: [Point(x: 2, y: 3)]),
]

for input in inputs {
    let route = findRoute(r: input.r, c: input.c, prohibited: input.prohibited)
    print(route.map(\.description).joined(separator: " -> "))
}

