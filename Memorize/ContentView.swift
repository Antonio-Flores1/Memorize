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
    var cards: some View{
        HStack {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: cardEmojisArray[index])
            }
        } .foregroundColor(.orange)
    }
    
    var cardRemover: some View {
        Button(action: {
            if cardCount > 1 {
                cardCount -= 1
            }
        }, label: {
            Image(systemName: "rectangle.stack.badge.minus.fill")
        })
    }
    
    var cardAdder: some View {
        Button(action: {
            if cardCount < cardEmojisArray.count {
                cardCount += 1
            }
        }, label: {
            Image(systemName: "rectangle.stack.badge.plus.fill")
        })
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
