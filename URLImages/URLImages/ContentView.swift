//
//  ContentView.swift
//  URLImages
//
//  Created by Piotr Tyl on 07/02/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        AsyncImage(url: URL(string: "https://gws.dev/img/logo.png")) { phase in
            if let image = phase.image {
            image
                .resizable()
                .scaledToFit()
            } else if phase.error != nil {
                Text("There was an error loading the image.")
            } else {
                ProgressView()
            }
        }
            .frame(width: 200, height: 200)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
