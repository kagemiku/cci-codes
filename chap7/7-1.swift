/*
要件:
  * 1~13のカードと、ジョーカーは今回は考えないものとする
  * 1はA、11はJ、12はQ、13はKと表現される
  * スペード・ダイヤ・ハート・クラブの4種類の模様がある。
*/

enum Suit {
    case spade
    case heart
    case diamond
    case club
}

protocol Card {
    var suit: Suit { get }
    var number: Int { get }

    var score: Int { get }
}

// Default implementations
extension Card {
    // "A", "2", ..., "J", "Q", "K"
    var symbol: String { ... }
}

// Black Jack用カード
struct BlackJackCard: Card {
    let suit: Suit
    let number: Int

    var score: Int { ... }
}

// 山札？
struct Deck<C: Card> {
    var cards: [C]

    mutating func shuffle() { ... }
    mutating func draw() -> C { ... }
    mutating func `return`(_ card: C) { ... }
}

