import Foundation

struct MemoryGame<CardContent> {
    var cards: [Card]
    
    init(numberOfCardPairs: Int, createCardContent: (Int) -> CardContent) {
        cards = [Card]()
        for pairIndex in 0..<numberOfCardPairs {
            let content = createCardContent(pairIndex)
            let cardA = Card(content: content, id: pairIndex * 2)
            let cardB = Card(content: content, id: pairIndex * 2 + 1) 
            cards.append(cardA)
            cards.append(cardB)
        }
    }
    
    mutating func choose(_ card: Card) {
        guard let chosenIndex = cards.firstIndex(of: card) else { return }
        cards[chosenIndex].isFaceUp.toggle()
    }
    
    struct Card: Identifiable, Equatable {
        static func == (lhs: MemoryGame<CardContent>.Card, rhs: MemoryGame<CardContent>.Card) -> Bool {
            return lhs.id == rhs.id && lhs.isFaceUp == rhs.isFaceUp
        }
        
        var isFaceUp = false
        var isMatched = false
        var content: CardContent
        var id: Int
    }
}
