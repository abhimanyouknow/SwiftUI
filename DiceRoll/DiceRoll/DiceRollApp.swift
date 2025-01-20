//
//  DiceRollApp.swift
//  DiceRoll
//
//  Created by C3PO MBP on 20/01/25.
//

import SwiftData
import SwiftUI

@main
struct DiceRollApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Score.self)
    }
}
