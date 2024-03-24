//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Antonio on 3/23/24.
//

import SwiftUI

class EmojiMemoryGame { 
   private var model: MemoryGame<String>
    
    var cards: Array<MemoryGame<String>.Card>{
        return model.cards
    }
    
    func choose(_  card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
