//
//  OneScreen.swift
//  TabbarDemo
//
//  Created by Veripark on 06/11/2023.
//

import SwiftUI

struct OneScreen: View {
    @State private var showAlert = false
    var value:DataModel
    var body: some View {
        VStack {
            Text(value.name)
            Button {
                showAlert.toggle()
            } label: {
                Text("Show ALERT")
            }

        }
        .alert("Title", isPresented: $showAlert) {
            Button {
                
            } label: {
                Text("Ok")
            }

        } message: {
            Text("Message")
        }

    }
}

struct OneScreen_Previews: PreviewProvider {
    static var previews: some View {
        OneScreen(value: DataModel())
    }
}
