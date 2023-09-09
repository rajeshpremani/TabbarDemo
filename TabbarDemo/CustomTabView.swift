//
//  CustomTabView.swift
//  TabbarDemo
//
//  Created by Veripark on 09/09/2023.
//

import SwiftUI

struct CustomTabView: View {
    @Binding var selectedTab:TabItem
    @Namespace private var animationNameSpace
    var body: some View {
        ZStack {
            Capsule()
                .fill(Color.white)
                .shadow(radius: 5)
                .frame(height: 70)
                
            HStack {
                ForEach(TabItem.allCases, id: \.self) { id in
                    Button {
                        selectedTab = id
                    } label: {
                        VStack {
                            Spacer()
                            Image(systemName: "house")
                            Text("\(id.id)")
                            
                            if id == selectedTab {
                                Capsule()
                                    .frame(height: 4)
                                    .padding(.horizontal)
                                    .matchedGeometryEffect(id: "selectedTab", in: animationNameSpace)
                                    .offset(y: 3)
                            }else {
                                Capsule()
                                    .fill(.clear)
                                    .frame(height: 4)
                                    .offset(y: 3)
                            }
                        }
                        .font(.caption)
                        .foregroundColor(.black)
                        .padding()
                    }
                }
            }
            .frame(height: 70)
            .frame(maxWidth: .infinity)
            
        }
        .padding(.horizontal)
        
    }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabView(selectedTab: .constant(.One))
    }
}
