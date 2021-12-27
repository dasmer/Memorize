import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
        
    private static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["👳🏻‍♂️", "🐶", "🥳", "🚀", "🍦", "🦷", "🥶", "🧶", "😎", "🤠", "🐣", "🏳️", "🇰🇷", "🇺🇸", "🇮🇳", "🇬🇧", "🇨🇦", "🇮🇸", "🇮🇱", "🏴󠁧󠁢󠁥󠁮󠁧󠁿", "🇭🇰", "🇹🇻", "🎮", "🚗"]
        
        return MemoryGame<String>(numberOfCardPairs: 6) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    
    @Published private var model = createMemoryGame()

    var cards: [Card] {
        return model.cards
    }
    
    // MARK: – Intents
    
    func choose(_ card: Card) {
        model.choose(card)
    }
}
