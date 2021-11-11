//
//  UIKitSliderView.swift
//  SliderValueGuessing
//
//  Created by Nadzeya Shpakouskaya on 09/11/2021.
//

import SwiftUI

struct UIKitSliderView: UIViewRepresentable {
    
    @Binding var value: Double
    
    let opacity: Double
    
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
        uiView.thumbTintColor = .red.withAlphaComponent(CGFloat(opacity))
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value)
    }
    
}

extension UIKitSliderView {
    class Coordinator: NSObject {
        @Binding var sliderValue: Double

        
        init(value: Binding<Double>) {
            self._sliderValue = value
        }
        
        @objc func sliderMoved(_ slider: UISlider) {
            sliderValue = Double(slider.value)
        }
        
    }
}

struct UIKitSliderView_Previews: PreviewProvider {
    static var previews: some View {
        UIKitSliderView(value: .constant(0.9), opacity: 0.75)
    }
}
