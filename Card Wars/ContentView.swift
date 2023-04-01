//
//  ContentView.swift
//  Card Wars
//
//  Created by hatem on 01/04/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var playerCard:String = "card13"
    @State var cpuCard:String = "card14"
    
    @State var playerScore = 0
    @State var cpuScore = 0
    
    var body: some View {
        ZStack {
            
            Image("background-cloth")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                Image("logo")
                Spacer()
                HStack {
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                Spacer()
                Button {
                    deal()
                } label: {
                    Image("button")
                }

                Spacer()
                HStack {
                    Spacer()
                    VStack {
                        Text("Player")
                            .font(.headline)
                            .padding(.vertical, 8.0)
                        Text(String(playerScore))
                            .font(.largeTitle)
                    }
                    
                    Spacer()
                    VStack {
                        Text("CPU")
                            .font(.headline)
                            .padding(.vertical, 8.0)
                        Text(String(cpuScore))
                            .font(.largeTitle)
                    }
                    
                    Spacer()
                }.foregroundColor(.white)
                
                Spacer()
            }
        }
    }
    
    func deal() {
        // Randomize Player Cards
        var playerCardValue:Int = Int.random(in: 2...14)
        playerCard = "card" + String(playerCardValue)
        
        // Randomize CPU Cards
        var cpuCardValue:Int = Int.random(in: 2...14)
        cpuCard = "card" + String(cpuCardValue)
        
        // Update the score
        if playerCardValue > cpuCardValue {
            playerScore += 1
        } else if playerCardValue == cpuCardValue {
            playerScore += 1
            cpuScore += 1
        } else {
            cpuScore += 1
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
