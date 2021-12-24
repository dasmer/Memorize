import SwiftUI

class EmojiMemoryGame: ObservableObject {
        
    private static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["👳🏻‍♂️", "🐶", "🥳", "🚀", "🍦", "🦷", "🥶", "🧶", "😎", "🤠", "🐣", "🏳️", "🇰🇷", "🇺🇸", "🇮🇳", "🇬🇧", "🇨🇦", "🇮🇸", "🇮🇱", "🏴󠁧󠁢󠁥󠁮󠁧󠁿", "🇭🇰", "🇹🇻", "🎮", "🚗"]
        
        return MemoryGame<String>(numberOfCardPairs: 5) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    
    @Published private var model = createMemoryGame()

    var cards: [MemoryGame<String>.Card] {
        return model.cards
    }
    
    // MARK: – Intents
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
