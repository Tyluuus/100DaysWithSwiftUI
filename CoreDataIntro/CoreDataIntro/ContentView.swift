//
//  ContentView.swift
//  CoreDataIntro
//
//  Created by Piotr Tyl on 07/02/2022.
//

import SwiftUI


struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var students: FetchedResults<Student>
    var body: some View {
        VStack {
            List(students) { student in
                Text(student.name ?? "unknown")
            }
        }
        Button("Add") {
            let firstNames = ["Ginny", "Harry", "Ron"]
            let lastNames = ["Potter", "Weasley", "Granger"]
            
            let chosenFirstName = firstNames.randomElement()!
            let chosenLastName = lastNames.randomElement()!
            
            let student = Student(context: moc)
            student.id = UUID()
            student.name = "\(chosenFirstName) \(chosenLastName)"
            
            try? moc.save()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
