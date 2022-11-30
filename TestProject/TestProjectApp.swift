//
//  TestProjectApp.swift
//  TestProject
//
//  Created by 茂田井雄輝 on 2022/11/30.
//

import SwiftUI

@main
struct TestProjectApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
