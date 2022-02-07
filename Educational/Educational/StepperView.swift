//
//  StepperView.swift
//  Educational
//
//  Created by Piotr Tyl on 20/09/2021.
//

import SwiftUI

struct StepperView: View {
    @State var title: String
    @Binding var selectedOption: Int
    var range: ClosedRange<Int>
    
    var body: some View {
        Stepper(title, value: $selectedOption, in: range)
        Text("\(title): \(selectedOption)")
    }
}

