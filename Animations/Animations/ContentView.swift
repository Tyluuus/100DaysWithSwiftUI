//
//  ContentView.swift
//  Animations
//
//  Created by Piotr Tyl on 11/08/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount: CGFloat = 1
    
    var body: some View {
        
        Button("tap"){
        //    self.animationAmount += 1
        }
        .padding(30)
        .background(Color.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .overlay(
            Circle()
                .stroke(Color.red)
                .scaleEffect(animationAmount)
                .opacity(Double(2 - animationAmount))
                .animation(
                    Animation.easeOut(duration: 1)
                        .repeatForever(autoreverses: false))
        )
        .onAppear {
            self.animationAmount = 2
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
