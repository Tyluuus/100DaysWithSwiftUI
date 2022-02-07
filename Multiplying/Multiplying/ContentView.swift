//
//  ContentView.swift
//  Multiplying
//
//  Created by Piotr Tyl on 11/08/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var settings = true
    @State private var questionsRange = 1
    @State private var ask = Questions(numberRange: 2)
    @State private var questionsNumber = 0
    let buttons: [String] = ["5", "10", "20", "All"]
    
    var body: some View {
        VStack{
            Spacer()
            Stepper("Multiplication range", onIncrement: {
                self.questionsRange += 1
                self.ask = Questions(numberRange: self.questionsRange)
            }, onDecrement: {
                self.questionsRange -= 1
                self.ask = Questions(numberRange: self.questionsRange)
            })
            Spacer()
            HStack{
                ForEach(0..<4) { number in
                    Button("\(buttons[number])", action: {
                        questionsNumber = Int(number)
                    })
                    .font(.title)
                    .opacity(40)
                    .frame(width: 50, height: 50, alignment: .center)
                }
            }
            Spacer()
            Group{
            
            if settings {
                settingsView()
                Spacer()
            } else {
                gameView()
                Spacer()
            }
        }
        }
    }
}


struct Questions {
    var text: [String] = []
    var answer: [String] = []
    let range: Int
    
    init(numberRange range: Int) {
        self.range = range
        for number in 1...range {
            for numberTwo in 1...range {
                self.text.append("\(number) x \(numberTwo)")
                self.answer.append("\(number*numberTwo)")
            }
        }
    }
}

struct gameView: View {
    var body: some View {
        Text("GameView")
    }
}

struct settingsView: View {
    var body: some View {
        Text("Settings")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
