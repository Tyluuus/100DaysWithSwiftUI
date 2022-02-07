//
//  ContentView.swift
//  Educational
//
//  Created by Piotr Tyl on 20/09/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var settingActive = true
    @State private var selectedMultiplicationTable: Int = 5
    @State private var questionsNumber: Int = 5
    @State private var questions: Array<Question> = []
    @State private var currentQuestionIndex: Int = 1
    @State private var usersAnswer: String = ""
    @State private var userScore = 0
    @State private var isGameCompleted = false
    @State private var endgameMessage = ""
    

    var body: some View {
        if settingActive {
            Group {
                VStack {
                    StepperView(title: "Multiplication Table", selectedOption: $selectedMultiplicationTable, range: 1...12)
                        .padding()
                    StepperView(title: "Number of questions", selectedOption: $questionsNumber, range: 5...20)
                    Spacer()
                    Button("Start game") {
                        generateQuestion()
                        settingActive.toggle()
                    }.frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 50, maxHeight: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(Color.blue)
                    .foregroundColor(.white)
                }
            }
        }
        
        else {
            Group {
                VStack {
                    Text("User score: \(userScore)")
                        .font(.title)
                        .padding()
                    Text("\(questions[currentQuestionIndex].data)")
                        .font(.title)
                        .padding()
                    TextField("Enter your answer", text: $usersAnswer)
                        .padding()
                    Spacer()
                    Button("Enter") {
                        checkAnswer(userAnswer: Int(usersAnswer) ?? 0, answer: questions[currentQuestionIndex].answer)
                    }.frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 50, maxHeight: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .alert(isPresented: $isGameCompleted) {
                        Alert(title: Text(endgameMessage), message: Text("Restart game"), primaryButton: .destructive(Text("Okay")) {
                            settingActive = true
                            usersAnswer = ""
                            userScore = 0
                            endgameMessage = ""
                            currentQuestionIndex = 1
                        }, secondaryButton: .cancel())
                    }
                }
            }
        }
    }
    
    func generateQuestion() {
        questions.removeAll()
        for question in 1...questionsNumber {
            let question = Question(data: "\(selectedMultiplicationTable) X \(question)", answer: selectedMultiplicationTable * question)
            questions.append(question)
        }
    }
    
    func checkAnswer(userAnswer: Int, answer: Int) {
        if userAnswer == answer {
            userScore += 1
        }
        usersAnswer = ""
        if currentQuestionIndex < questionsNumber - 1 {
            currentQuestionIndex += 1
        } else {
            endgameMessage = "Your score is \(userScore)"
            isGameCompleted = true
        }
    }
}

    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
