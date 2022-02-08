//
//  CoreDataProjectApp.swift
//  CoreDataProject
//
//  Created by Piotr Tyl on 08/02/2022.
//

import SwiftUI

@main
struct CoreDataProjectApp: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
