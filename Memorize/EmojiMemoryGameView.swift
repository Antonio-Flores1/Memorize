//
//  ContentView.swift
//  Memorize
//
//  Created by Antonio on 3/1/24.
//

import SwiftUI

// Default Struct setup for ContentView
//struct ContentView: View { Default
//    var body: some View {
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, CS193P!")
//        }
//        // Changes everything insode image and text
//        .padding()
//        .font(.largeTitle)
//        
//    }
//}

struct EmojiMemoryGameView: View {
    //Bad code will change
    var viewModel: EmojiMemoryGame = EmojiMemoryGame()
    

    // Not used in real code
    @ State var cardCount = 4
    
    var body: some View {
            ScrollView{
                cards
            Spacer()
            cardCountAdjusters
        }
        // Changes everything inside image and text
        .padding()
     }
    
    var cardCountAdjusters: some View{
        HStack {
        }
        .font(.largeTitle)
        .foregroundColor(.orange)
    }
    
    
    //Cards Not a view builder HStack is a view builder
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0) {
            ForEach(viewModel.cards.indices, id: \.self) { index in
                CardView(viewModel.cards[index])
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
            }
        } 
        .foregroundColor(.orange)
    }
    
    

}
    


struct CardView: View {
    var card: MemoryGame <String>.Card
    
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    
    var body: some View{
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.system(size: 85))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            base.fill()
                .opacity(card.isFaceUp ? 0 : 1)
        }
    }
}

struct EmojiMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView()
    }
}
