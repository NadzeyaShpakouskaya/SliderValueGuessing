//
//  UIKitSliderView.swift
//  SliderValueGuessing
//
//  Created by Nadzeya Shpakouskaya on 09/11/2021.
//

import SwiftUI

struct UIKitSliderView: UIViewRepresentable {
    
    @Binding var value: Double
    @Binding var targetValue: Int
    @Binding var opacity: Double
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.tintColor = .gray
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.sliderMoved),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(value)
        uiView.thumbTintColor = UIColor(red: 255,
                                        green: 0,
                                        blue: 0,
                                        alpha: CGFloat(opacity))
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value, targetValue: $targetValue, opacity: $opacity)
    }
    
}

extension UIKitSliderView {
    class Coordinator: NSObject {
        @Binding var sliderValue: Double
        @Binding var targetValue: Int
        @Binding var opacity: Double
        
        init(value: Binding<Double>, targetValue: Binding<Int>, opacity: Binding<Double>) {
            self._sliderValue = value
            self._targetValue = targetValue
            self._opacity = opacity
        }
        
        @objc func sliderMoved(_ slider: UISlider) {
            sliderValue = Double(slider.value)
            opacity = defineOpacity()
        }
        
        private func defineOpacity() -> Double {
            let diff = abs(targetValue - lround(sliderValue * 100))
            return 1 - Double(diff) / Double(100)
        }
        
    }
}

struct UIKitSliderView_Previews: PreviewProvider {
    static var previews: some View {
        UIKitSliderView(value: .constant(0.9), targetValue: .constant(75), opacity: .constant(0.9))
    }
}
