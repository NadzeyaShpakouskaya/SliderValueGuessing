//
//  ContentView.swift
//  SliderValueGuessing
//
//  Created by Nadzeya Shpakouskaya on 09/11/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var currentValue: Double = 50
    @State private var targetValue: Int = 90


    
    @State private var isAlertPresenting =  false
    
    var body: some View {
        VStack{
            HStack{
                Text("Move slider as close as you can to")
                Text("\(targetValue)")
                    .frame(width: 25)
            }.font(.callout)
               
            SliderView(currentValue: $currentValue)
            VStack(spacing: 20){
                Button(action: checkValue) {
                    Text("Check my guessing")
                }
                .alert(Text("Your score is \(calculateScore()) of 100"), isPresented: $isAlertPresenting) {
                }
                Button(action: restartGame) {
                    Text("Restart game")
                }
            }
            
        }.padding()
    }
    
    private func checkValue() {
        isAlertPresenting.toggle()
    }
    
    private func restartGame() {
        targetValue = Int.random(in: 0...100)
        
    }
    
    private func calculateScore() -> Int {
        let difference  = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SliderView: View {
    @Binding var currentValue: Double
    
    var body: some View {
        HStack{
            Text("0")
            Slider(value: $currentValue, in: 0...100) {
            }
            Text("100")
        }.padding()
    }
    
}
