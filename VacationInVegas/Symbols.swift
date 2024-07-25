//
//  Symbols.swift
//  VacationInVegas
//
//  Created by Mayur Vaity on 25/07/24.
//

import SwiftUI

struct Symbols: View {
    @State private var shouldIBounce = false
    @State private var shouldIRotate = false
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .font(.largeTitle)
                .imageScale(.large)
                .foregroundStyle(.tint)
                .symbolEffect(.pulse)
            
            Image(systemName: "paperplane")
                .font(.largeTitle)
                .imageScale(.large)
                .foregroundStyle(.teal)
                .symbolEffect(.wiggle) //wiggles at the direction symbol is pointing
            
            Image(systemName: "wifi")
                .font(.largeTitle)
                .imageScale(.large)
                .foregroundStyle(.purple)
                .symbolEffect(.variableColor.reversing) //it only works on symbols with multple parts like wifi
            //reversing - to have multiple directions to the symbol
            
            Image(systemName: "person.crop.circle.badge.plus")
                .font(.largeTitle)
                .imageScale(.large)
                .foregroundStyle(.tint)
                .symbolRenderingMode(.multicolor)
                .symbolEffect(.bounce, value: shouldIBounce) //also can control the effects with a bool property, in this case, it bounces once tapped on the symbol
                .onTapGesture {
                    shouldIBounce.toggle()
                }
            
            //3 layered image example
            Image(systemName: "cloud.sun.rain.fill")
                .font(.largeTitle)
                .imageScale(.large)
                .foregroundStyle(.gray, .yellow, .mint) //can specify 3 diff colors for each part of the symbol
                .symbolEffect(.bounce, value: shouldIBounce) //bouncing with 3 diff layers
                .onTapGesture {
                    shouldIBounce.toggle()
                }
            
            Image(systemName: "arrow.clockwise.square")
                .font(.largeTitle)
                .imageScale(.large)
                .foregroundStyle(.blue.mix(with: .red, by: 0.5)) //can give color between 2 specified colors
            //by - 0.5 is 50-50%, can change as per preference of to which color i should lean more
                .symbolEffect(.rotate, value: shouldIRotate) //it rotates in the direction where arrow is pointing
                .onTapGesture {
                    //to only rotate when tapped on the symbol
                    shouldIRotate.toggle()
                }
            
            Image(systemName: "sun.max.fill")
                .font(.largeTitle)
                .imageScale(.large)
                .foregroundStyle(.yellow)
                .symbolEffect(.breathe)
            
        }
        .padding()
    }
}

#Preview {
    Symbols()
}
