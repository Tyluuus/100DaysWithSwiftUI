//
//  ShapeTriangle.swift
//  Drawing_Intro
//
//  Created by Piotr Tyl on 21/11/2021.
//

import SwiftUI

struct ShapeTriangle: View {
    struct Triangle: Shape {
        func path(in rect: CGRect) -> Path {
            var path = Path()
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
            return path
        }
    }
    var body: some View {
        
        Triangle()
            .fill(.red)
            .frame(width:300, height: 300)
}
}


