//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Antonio on 3/21/24.
//

import Foundation


struct MemoryGame<CardContent>{
    private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    func choose(card: Card) {
         
    }
    
    struct Card {
        var isFaceUp = true
        var isMatched = false
        let content: CardContent
        
    }
    
}
