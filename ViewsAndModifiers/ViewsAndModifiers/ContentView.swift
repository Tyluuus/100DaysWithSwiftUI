//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Piotr Tyl on 20/07/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button("Hell'o World") {
            print(type(of: self.body))
        }
        .frame(width: 200, height: 200)
        .background(Color.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

