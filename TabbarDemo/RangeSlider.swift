//
//  RangeSlider.swift
//  TabbarDemo
//
//  Created by Veripark on 10/09/2023.
//

import SwiftUI

struct RangeSlider: View {
    @State private var width: CGFloat = 0
    @State private var width1: CGFloat = 25
    var totalWidth = UIScreen.main.bounds.width - 60
    var body: some View {
        
        VStack {
            
            Text("Values")
                .fontWeight(.semibold)
            Text("\(getValue(value: width / totalWidth)) - \(getValue(value: width1 / totalWidth))")
            
            
            
            ZStack(alignment: .leading){
                Rectangle()
                    .fill(Color.black.opacity(0.20))
                    .frame(height: 6)
                
                Rectangle()
                    .fill(Color.black)
                    .frame(width: width1 - width, height: 6)
                    .offset(x: width + 20)
                
                HStack(spacing: 0) {
                    Circle()
                        .frame(width: 20, height: 20)
                        .offset(x: width)
                        .gesture(
                            DragGesture()
                                .onChanged({ value in
                                    if value.location.x >= 0 && value.location.x <= width1 {
                                        self.width = value.location.x
                                    }
                                })
                        )
                    
                    Circle()
                        .frame(width: 20, height: 20)
                        .offset(x: width1)
                        .gesture(
                            DragGesture()
                                .onChanged({ value in
                                    if value.location.x <= self.totalWidth && value.location.x >= width {
                                        self.width1 = value.location.x
                                    }
                                })
                        )
                }
                
            }
            .padding()
        }
    }
    
    func getValue(value: CGFloat) -> String{
        return String(format: "%.2f", value)
    }
}

struct RangeSlider_Previews: PreviewProvider {
    static var previews: some View {
        RangeSlider()
    }
}
