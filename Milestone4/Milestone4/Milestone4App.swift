//
//  Milestone4App.swift
//  Milestone4
//
//  Created by C3PO MBP on 17/12/24.
//

import SwiftData
import SwiftUI

@main
struct Milestone4App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
