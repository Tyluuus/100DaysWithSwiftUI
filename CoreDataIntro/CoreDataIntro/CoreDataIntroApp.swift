//
//  CoreDataIntroApp.swift
//  CoreDataIntro
//
//  Created by Piotr Tyl on 07/02/2022.
//

import SwiftUI

@main
struct CoreDataIntroApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
