//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Antonio on 3/21/24.
//

import Foundation


struct MemoryGame<CardContent>{
        
    private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int) {
        cards = []
    }
    
    func choose(card: Card) {
         
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
        
    }
    
}
