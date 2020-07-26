//
//  ContentView.swift
//  ChoiceColor
//
//  Created by Виктор Устюжанин on 26.07.2020.
//  Copyright © 2020 Виктор Устюжанин. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var redSlidervalue = 0.0
    @State var greenSlidervalue = 0.0
    @State var blueSlidervalue = 0.0
    
    let rate = 255.0
    let shapeField = RoundedRectangle(cornerRadius: 20, style: .circular)

    var body: some View {
        
        ZStack{
            Color(.systemBlue)
                .opacity(0.8)
                .edgesIgnoringSafeArea(.all)
            VStack{
                Color(red: redSlidervalue/rate, green: greenSlidervalue/rate, blue: blueSlidervalue/rate)
                    .clipShape(shapeField)
                    .overlay(shapeField.stroke(Color.white, lineWidth: 4))
                    .padding()
                    .frame(height: 200)
                
                ColorSlider(value: $redSlidervalue, sliderColor: .red)
                ColorSlider(value: $greenSlidervalue, sliderColor: .green)
                    .padding(.vertical, -30.0)
                ColorSlider(value: $blueSlidervalue, sliderColor: .blue)
                
                Spacer()
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ColorSlider: View {
    
    @Binding var value: Double
    
    var sliderColor: Color
    
    var body: some View {
        HStack{
            
            Text(String(lround(value)))
                .foregroundColor(.white)
                .padding(.leading)
            Slider(value: $value, in: 0...255, step: 1)
                .accentColor(sliderColor)
                .padding()
            TextField("", value: $value, formatter: NumberFormatter())
                .background(Color.white)
                .frame(width: 35)
                .cornerRadius(4)
                .padding(.trailing)
        }
    }
}
