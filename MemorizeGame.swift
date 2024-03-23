//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Antonio on 3/21/24.
//

import Foundation


struct MemoryGame<CardContent>{
    
    var cards: Array<Card>
    
    func choose(card: Card) {
         
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
        
    }
    
}
