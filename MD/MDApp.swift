//
//  MDApp.swift
//  MD
//
//  Created by 문재윤 on 4/10/24.
//

import SwiftUI
import SwiftData

//@main
//struct MDApp: App {
//    
//    var sharedModelContainer: ModelContainer = {
//        let schema = Schema([
//            Item.self, Image.self
////            Money.self
//        ])
//        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
//
//        do {
//            return try ModelContainer(for: schema, configurations: [modelConfiguration])
//        } catch {
//            fatalError("Could not create ModelContainer: \(error)")
//        }
//    }()
//
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//        }
//        .modelContainer(sharedModelContainer)
//    }
//}
@main
struct MDApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Item.self])
    }
}
