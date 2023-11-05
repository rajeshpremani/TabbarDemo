//
//  ContentView.swift
//  TabbarDemo
//
//  Created by Veripark on 09/09/2023.
//

import SwiftUI

enum TabItem:String, CaseIterable, Identifiable{
    case One
    case Two
    case Three
    case Four
    
    var id:String{self.rawValue}
    
    @ViewBuilder
    var view: some View{
        switch self {
        case .One:
            ZStack{
                Image("bg")
                    .resizable()
                    .ignoresSafeArea()
                VStack{
                    Text("View \(id)")
                    Spacer()
                }.frame(maxWidth: .infinity)
                
            }
            .ignoresSafeArea()
//            .background(
//                Image("bg")
//                    .resizable()
//                    .ignoresSafeArea()
//
//            )
            .navigationTitle("One")
            
        case .Two:
            ZStack{
                Color.blue
                Text("View \(id)")
            }
            .ignoresSafeArea()
            .navigationTitle("Two")
        case .Three:
            ZStack{
                Color.green
                Text("View \(id)")
            }
            .ignoresSafeArea()
            .navigationTitle("Three")
        case .Four:
            ZStack{
                Color.cyan
                Text("View \(id)")
            }
            .ignoresSafeArea()
            .navigationTitle("Four")
        }
    }
}

struct ContentView: View {
    @State private var selectedTag:TabItem = .One
    var body: some View {
        NavigationStack {
            TabView(selection: $selectedTag) {
                ForEach(TabItem.allCases) { value in
                    value.view
                        .tag(value)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
//            .navigationTitle(selectedTag.id)
            .overlay(alignment: .bottom) {
                CustomTabView(selectedTab: $selectedTag)
        }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
