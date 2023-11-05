//
//  HomeScreen.swift
//  TabbarDemo
//
//  Created by Veripark on 06/11/2023.
//

import SwiftUI

enum Router:Hashable{
    static func == (lhs: Router, rhs: Router) -> Bool {
        return false
    }
    
    func hash(into hasher: inout Hasher) {
        
    }
    
    case one(value: DataModel)
    case two
}

class DataModel:Codable{
    var name:String = "My Name"
}

class Navigate:ObservableObject{
    @Published var route: [Router] = []
    
    func navigate(_ value:Router){
        route.append(value)
    }
}

struct HomeScreen: View {
    
    @ObservedObject var navigator = Navigate()
    
    var body: some View {
        NavigationStack(path: $navigator.route){
            VStack {
                Text("Home")
                Button(action: {
                    navigator.navigate(.one(value: DataModel()))
                }, label: {
                    Text("One")
                })
                Button(action: {
                    navigator.navigate(.two)
                }, label: {
                    Text("Two")
                })
                    .navigationDestination(for: Router.self) { route in
                        switch route {
                        case .one(let value): OneScreen(value: value)
                        case .two: TwoScreen()
                        }
                }
            }
        }
        .environmentObject(navigator)
            
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
