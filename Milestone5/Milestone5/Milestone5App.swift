//
//  Milestone5App.swift
//  Milestone5
//
//  Created by C3PO MBP on 02/01/25.
//

import SwiftData
import SwiftUI

@main
struct Milestone5App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: People.self)
    }
}
