//
//  ContentView.swift
//  SliderValueGuessing
//
//  Created by Nadzeya Shpakouskaya on 09/11/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var currentValue = 0.5
    @State private var targetValue = 70
    @State private var isAlertPresenting =  false
    
    var body: some View {
        VStack {
            infoView
            sliderView
            buttonsView
        }.padding()
    }
    
    private func restartGame() {
        targetValue = Int.random(in: 0...100)
    }
    
    
    private func defineOpacity() -> Double {
        let diff = abs(targetValue - lround(currentValue * 100))
        return 1 - Double(diff) / Double(100)
    }
}

// MARK: - Subviews
extension ContentView {
    private var infoView: some View {
        HStack{
            Text("Move slider as close as you can to")
            Text("\(targetValue)")
                .frame(width: 25)
        }.font(.callout)
    }
    
    private var sliderView: some View {
        HStack{
            Text("0")
            
            UIKitSliderView(
                value: $currentValue,
                opacity: defineOpacity()
            )
                .onChange(of: currentValue) { newValue in
                    currentValue = newValue
                }
            
            Text("100")
        }
    }
    
    private var buttonsView: some View {
        VStack(spacing: 20) {
            Button(action: { isAlertPresenting.toggle() }) {
                Text("Check my guessing")
            }
            .alert(Text("Your are \(lround(defineOpacity() * 100))% right."),
                   isPresented: $isAlertPresenting) {}
            
            Button(action: restartGame) {
                Text("Restart game")
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
