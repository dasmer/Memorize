import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
        
    private static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["๐ณ๐ปโโ๏ธ", "๐ถ", "๐ฅณ", "๐", "๐ฆ", "๐ฆท", "๐ฅถ", "๐งถ", "๐", "๐ค ", "๐ฃ", "๐ณ๏ธ", "๐ฐ๐ท", "๐บ๐ธ", "๐ฎ๐ณ", "๐ฌ๐ง", "๐จ๐ฆ", "๐ฎ๐ธ", "๐ฎ๐ฑ", "๐ด๓ ง๓ ข๓ ฅ๓ ฎ๓ ง๓ ฟ", "๐ญ๐ฐ", "๐น๐ป", "๐ฎ", "๐"]
        
        return MemoryGame<String>(numberOfCardPairs: 6) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    
    @Published private var model = createMemoryGame()

    var cards: [Card] {
        return model.cards
    }
    
    // MARK: โย Intents
    
    func choose(_ card: Card) {
        model.choose(card)
    }
}
