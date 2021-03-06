import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    var cards: [Card]
    
    private var currentOneAndOnlyFaceUpCardIndex: Int? {
        get {
            let faceUpCardIndexes = cards.indices.filter { cards[$0].isFaceUp }

            return faceUpCardIndexes.count == 1 ? faceUpCardIndexes.first : nil
        }

        set {
            for cardIndex in cards.indices {
                let isFaceUp = cardIndex == newValue
                cards[cardIndex].isFaceUp = isFaceUp
            }
        }
    }

    init(numberOfCardPairs: Int, createCardContent: (Int) -> CardContent) {
        cards = []
        for pairIndex in 0..<numberOfCardPairs {
            let content = createCardContent(pairIndex)
            let cardA = Card(content: content, id: pairIndex * 2)
            let cardB = Card(content: content, id: pairIndex * 2 + 1) 
            cards.append(cardA)
            cards.append(cardB)
        }
    }
    
    mutating func choose(_ card: Card) {
        guard let chosenIndex = cards.firstIndex(of: card),
                !card.isFaceUp,
                !card.isMatched else { return }

        if let faceUpCardIndex = currentOneAndOnlyFaceUpCardIndex {
            if cards[chosenIndex].content == cards[faceUpCardIndex].content {
                cards[chosenIndex].isMatched = true
                cards[faceUpCardIndex].isMatched = true
            }
            cards[chosenIndex].isFaceUp = true
        } else {
            currentOneAndOnlyFaceUpCardIndex = chosenIndex
        }
    }

    struct Card: Identifiable, Equatable {
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
        let id: Int
    }
}
