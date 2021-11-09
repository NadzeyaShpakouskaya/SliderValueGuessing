//
//  ContentView.swift
//  SliderValueGuessing
//
//  Created by Nadzeya Shpakouskaya on 09/11/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var sliderValue: Double = 50
    @State private var guessValue: Int = 90
    
    var body: some View {
        VStack{
            HStack{
                Text("Move slider as close as you can to")
                Text("\(guessValue)")
                    .frame(width: 25)
            }.font(.callout)
               
            HStack{
                Text("0")
                Slider(value: $sliderValue)
                Text("100")
            }.padding()
            VStack(spacing: 20){
                Button(action: checkValue) {
                    Text("Check my guessing")
                }
                Button(action: restartGame) {
                    Text("Restart game")
                }
            }
            
        }.padding()
    }
    
    private func checkValue() {
        
    }
    
    private func restartGame() {
        guessValue = Int.random(in: 0...100)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
