//
//  HotProspectsApp.swift
//  HotProspects
//
//  Created by C3PO MBP on 04/01/25.
//

import SwiftData
import SwiftUI

@main
struct HotProspectsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Prospect.self)
    }
}
