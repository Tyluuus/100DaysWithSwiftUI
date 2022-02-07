//
//  LEsson.swift
//  Moonshot_introduction
//
//  Created by Piotr Tyl on 14/11/2021.
//

import SwiftUI

struct LEsson: View {
    var body: some View {
        NavigationView {
            List(0..<100) { row in
            NavigationLink {
                Text("Detail \(row)")
            } label: {
            Text("Row \(row)")
                .padding()
            }
            .navigationTitle("SwiftUI")
        }
        }
    }
}

struct LEsson_Previews: PreviewProvider {
    static var previews: some View {
        LEsson()
    }
}
