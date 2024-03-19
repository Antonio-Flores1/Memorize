//
//  ContentView.swift
//  Memorize
//
//  Created by Antonio on 3/1/24.
//

import SwiftUI

// Defaukt atruct setup for ContentView
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

struct ContentView: View {
    let cardEmojisArray: Array<String> = ["👻","🚑","🔫","🧿","💰","💊","🔫","❤️","🏃🏻‍♂️","☘️","🫡","🪴"]
    // Not used in real code
    @ State var cardCount = 4
    
    var body: some View {
        VStack {
            cards
            Spacer()
            cardCountAdjusters
        }
        // Changes everything inside image and text
        .padding()
     }
    
    var cardCountAdjusters: some View{
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }
        .font(.largeTitle)
        .foregroundColor(.orange)
    }
    
    //Cards Not a view builder HStack is a view builder
    var cards: some View {
        LazyVGrid(columns: [GridItem(),GridItem(),GridItem()]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: cardEmojisArray[index])
            }
        } 
        .foregroundColor(.orange)
    }
    
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
             cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > cardEmojisArray.count)
    }
    
    
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
    
    var cardAdder: some View {
        cardCountAdjuster(by: +1, symbol: "rectangle.stack.badge.plus.fill")
    }
}
    
struct CardView: View {
    //Pointer
    let content: String
    @State var isFaceUp = true
    var body: some View{
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            
            if isFaceUp {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            } else {
                base.fill()
                }
        }.onTapGesture {
            isFaceUp.toggle()
           }
        }
    }

#Preview {
    ContentView()
}
