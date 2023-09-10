//
//  CircularProgress.swift
//  TabbarDemo
//
//  Created by Veripark on 10/09/2023.
//

import SwiftUI

struct CircularProgress: View {
    @State var size = UIScreen.main.bounds.width - 100
    @State private var progress: CGFloat = 0
    @State private var angle: Double = 0
    
    var body: some View {
        ZStack{
            //Whole Circle
            Circle()
                .stroke(Color.gray,style: StrokeStyle(lineWidth: 40, lineCap: .round))
                .frame(width: size, height: size)
            
            //Progress
            Circle()
                .trim(from: 0, to: progress)
                .stroke(Color.indigo,style: StrokeStyle(lineWidth: 40, lineCap: .round))
                .frame(width: size, height: size)
            
            Circle()
                .frame(width: 40, height: 40)
                .offset(x: size/2)
            
            //Drag
            Circle()
                .frame(width: 40, height: 40)
                .offset(x: size/2)
                .rotationEffect(.init(degrees: angle))
            //Adding Drag gesture
                .gesture(DragGesture().onChanged(onDrag(value:)))
            
            
        }
    }
    
    func onDrag(value: DragGesture.Value){
        
        let vactor = CGVector(dx: value.location.x, dy: value.location.y)
        
        let radians = atan2(vactor.dy - 27.5, vactor.dx - 27.5)
        
        var angle = radians * 180 / .pi
        
        if angle < 0 {angle = 360 + angle}
        
        withAnimation(Animation.linear(duration: 0.15)) {
            self.progress = angle / 360
            self.angle = Double(angle)
        }
        
    }
}

struct CircularProgress_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgress()
    }
}
