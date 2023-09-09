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
            Text("View \(id)")
        case .Two:
            Text("View \(id)")
        case .Three:
            Text("View \(id)")
        case .Four:
            Text("View \(id)")
        }
    }
}

struct ContentView: View {
    @State private var selectedTag:TabItem = .One
    var body: some View {
        TabView(selection: $selectedTag) {
            ForEach(TabItem.allCases) { value in
                value.view
                    .tag(value)
            }
        }
        .overlay(alignment: .bottom) {
            CustomTabView(selectedTab: $selectedTag)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
