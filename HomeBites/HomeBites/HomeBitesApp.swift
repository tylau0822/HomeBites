//
//  HomeBitesApp.swift
//  HomeBites
//
//  Created by LAU TSZ YING on 4/6/2025.
//

import SwiftUI
import SwiftData

@main
struct HomeBitesApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Dish.self,
            Order.self,
            OrderItem.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            HomeView()
        }
        .modelContainer(sharedModelContainer)
    }
}
