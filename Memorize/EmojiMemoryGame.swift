//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Antonio on 3/23/24.
//

import SwiftUI


class EmojiMemoryGame { 
    
    private static let emojis = ["👻","🚑", "🔫","🧿","💰","💊","🔫","❤️","🏃🏻‍♂️","☘️","🫡","🪴"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 4) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    private var model = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card>{
        return model.cards
    }
    
    func choose(_  card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
