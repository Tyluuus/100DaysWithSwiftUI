//
//  ContentView.swift
//  Moonshot_introduction
//
//  Created by Piotr Tyl on 14/11/2021.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        
        GeometryReader { geo in
            Image("Example")
                .resizable()
                .scaledToFit()
                .frame(width: geo.size.width*0.8)
                .frame(width: geo.size.width, height: geo.size.height)
        }
        
        ScrollView {
            LazyVStack(spacing: 10) {
                ForEach(0..<100) {
                    CustomText("Item \($0)")
                        .font(.title)
                }
            }
            .frame(maxWidth: .infinity)
        }
        
            
    }
}

struct CustomText: View {
    let text: String
    
    var body: some View {
        Text(text)
    }
    
    init(_ text: String) {
        print("Creating a new CustomText")
        self.text = text
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
