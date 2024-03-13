//
//  ContentView.swift
//  Memorize
//
//  Created by Antonio on 3/1/24.
//

import SwiftUI

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
    let cardEmojisArray: Array<String> = ["👻","💩","🔫","🧿"]

    
    var body: some View {
        HStack {
            
            ForEach(0..<4, id: \.self) { index in CardView(content: cardEmojisArray[index])
                
            }
            CardView(content: cardEmojisArray[0], isFaceUp: false)
            CardView(content: cardEmojisArray[1], isFaceUp: false)
            CardView(content: cardEmojisArray[2], isFaceUp: false)
            CardView(content: cardEmojisArray[3], isFaceUp: false)
        }
        // Changes everything insode image and text
//        .font(.largeTitle)
        .foregroundColor(.orange)
        .padding()
    }
}
    
struct CardView: View {
    //Pointer]
    let content: String
    @State var isFaceUp = true
    
    
    
    var body: some View{
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            
            if isFaceUp {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
//                Text("👻").font(.largeTitle)
            } else {
                base.fill()
                }
        }.onTapGesture {
            isFaceUp = !isFaceUp
           }
        }
    }

#Preview {
    ContentView()
}
