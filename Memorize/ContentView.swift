//
//  ContentView.swift
//  Memorize
//
//  Created by Валентина Буланова on 02.08.2021.
//

import SwiftUI

struct ContentView: View {
    var emojisFruits = ["🥦", "🍓", "🍆", "🍒", "🍏", "🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🫐", "🍈", "🍑", "🥭", "🍍", "🥥", "🥝", "🥑"]
    var emojisTransport = ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🚛", "🚜", "🦽", "🦼", "🛴", "🚲", "🛵", "🏍", "🛺", "🚔", "🚍", "🚘", "🚖", "🚡", "🚟", "🚃", "🚋", "🚝", "🚂", "✈️", "🛰", "🚀", "🚁", "⛵️", "🚤", "🛳", "⛴", "🚢"]
    var emojisFaces = ["😀", "😆", "😍", "🥰", "😛", "🤓", "🤩", "🥸", "😎", "🥳", "🥺", "😫", "😭", "😤", "🤯", "🤬", "😳", "🥵", "🥶", "😱", "😶‍🌫️", "😨", "🤫", "🤗", "🤭", "🤐", "😵‍💫", "🤢", "🤧", "🤒", "🤠", "🤑", "💀", "👽", "😻", "😽", "😹"]
    @State var emojis: [String] = []
    @State var emojisCount: Int = 0
    var body: some View {
        VStack {
            Label{
                Text("Memorize!")

            } icon: {
            }
           .font(.largeTitle)
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]){
                    if emojisCount != 0 {
                        ForEach(emojis[0...emojisCount], id: \.self) { emoji in
                            CardView(content: emoji)
                                .aspectRatio(2/3, contentMode: .fit)
                        }
                    }
                }
            }
            .foregroundColor(.orange)
            Spacer()
            HStack{
                emojiFaces
                Spacer()
                emojiTransport
                Spacer()
                emojiFruit
            }
            .padding(.horizontal)
        }
    }
    
    
    var emojiFaces : some View {
        Button{
            emojisCount = Int.random(in: 4..<emojisFaces.count)
            emojis = emojisFaces.shuffled()
        } label: {
            VStack{
                Image(systemName: "face.smiling")
                    .font(.largeTitle)
                Text("Smiles")
                    
            }
            
        }
    }
    
    var emojiTransport : some View {
        Button{
            emojisCount = Int.random(in: 4..<emojisTransport.count)
            emojis = emojisTransport.shuffled()
        } label: {
            VStack{
                Image(systemName: "car")
                    .font(.largeTitle)
                Text("Trasport")
                    
            }
            
        }
    }
    
    var emojiFruit : some View {
        Button{
            emojisCount = Int.random(in: 4..<emojisFruits.count)
            emojis = emojisFruits.shuffled()
        } label: {
            VStack{
                Image(systemName: "leaf")
                    .font(.largeTitle)
                Text("Fruits")
                    
            }
            
        }
    }
}

struct CardView: View {
    @State var isFaceUP: Bool = false
    var content:String
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20.0)
            if isFaceUP {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUP = !isFaceUP
        }
    }
}




















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
    }
}
