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
    var body: some View {
        HStack {
            CardView()
            CardView()
            CardView()
            CardView()
        }
        // Changes everything insode image and text
//        .font(.largeTitle)
        .foregroundColor(.orange)
        .padding()
    }
}
    
struct CardView: View {
    //Pointer
    @State var isFaceUp = true
    
    
    
    var body: some View{
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            
            if isFaceUp {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text("👻").font(.largeTitle)
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
