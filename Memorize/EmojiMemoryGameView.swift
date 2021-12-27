import SwiftUI

struct EmojiMemoryGameView: View {
    
    @ObservedObject var game: EmojiMemoryGame
    
    var body: some View {
        AspectVGrid(items: game.cards, aspectRatio: DrawingConstants.aspectRatio) { card in
            CardView(card: card)
                .padding(4)
                .onTapGesture {
                    game.choose(card)
                }
        }
        .foregroundColor(.red)
        .padding(.horizontal)
    }

    private struct DrawingConstants {
        static let minimumWidth: CGFloat = 65
        static let aspectRatio: CGFloat = 2/3
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        let game = EmojiMemoryGame()
        EmojiMemoryGameView(game: game)
            .preferredColorScheme(.dark)
        EmojiMemoryGameView(game: game)
            .preferredColorScheme(.light)
    }
}

struct CardView: View {
    private let card: EmojiMemoryGame.Card

    init(card: EmojiMemoryGame.Card) {
        self.card = card
    }

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                let shape =  RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
                if card.isFaceUp {
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
                    Text(card.content).font(fontforSize(geometry.size))
                } else if card.isMatched {
                    shape.opacity(0)
                }
                else {
                    shape.fill()
                }
            }
        }
    }

    private func fontforSize(_ size: CGSize) -> Font {
        Font.system(size: DrawingConstants.fontScale * min(size.width, size.height))
    }

    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 10
        static let lineWidth: CGFloat = 3
        static let fontScale: CGFloat = 0.75
    }
}
