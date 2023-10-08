//
//  PageViewScreen.swift
//  TabbarDemo
//
//  Created by Veripark on 07/10/2023.
//

import SwiftUI

struct PageViewScreen: View {
    var colors:[Color] = [.red, .green, .blue, .cyan]
    
    @Namespace var namespace
    
    
    @State var currentIndex = 0
    var body: some View {
        ScrollView(.init()) {
            TabView(selection: $currentIndex){
                ForEach(colors.indices, id: \.self) { index in
                    colors[index]
                        .tag(
                            withAnimation{
                                index
                            }
                            
                        )
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .overlay(alignment: .bottom, content: {
                HStack(spacing:15){
                    ForEach(colors.indices, id: \.self) { index in
                        if currentIndex == index{
                            ZStack(alignment: .trailing) {
                                Circle()
                                    .fill(.white)
                                    .frame(width: 7)
                                    .matchedGeometryEffect(id: "page", in: namespace)
                                    .animation(.easeIn(duration: 0.1))
                                    
                                Capsule()
                                    .fill(.white)
                                    .frame(width: 20 , height: 7)
                                    .matchedGeometryEffect(id: "page", in: namespace)
                                .animation(.easeIn(duration: 0.1))
                            }
                        }else{
                            Circle()
                                .fill(.white)
                                .frame(width: 7)
                        }
                        
                    }
                }
                .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom)
            })
        
        }
        .ignoresSafeArea()
    }
    
    

//    func getIndex() -> Int{
//        let index = Int(round(Double(offset / getWidth())))
//        return index
//
//    }
    
    
}

extension View{
    func getWidth() -> CGFloat{
        return UIScreen.main.bounds.width
    }
}

struct PageViewScreen_Previews: PreviewProvider {
    static var previews: some View {
        PageViewScreen()
    }
}
