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
        LazyVGrid(columns: [GridItem(),GridItem(),GridItem()]) {
            ForEach(viewModel.cards.indices, id: \.self) { index in
                CardView(card: viewModel.cards[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        } 
        .foregroundColor(.orange)
    }
    
    

}
    


struct CardView: View {
    var card: MemoryGame <String>.Card
    var body: some View{
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(card.content).font(.largeTitle)
                base.fill().opacity(card.isFaceUp ? 0 : 1)
            }
        }
    }
}

struct EmojiMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView()
    }
}
