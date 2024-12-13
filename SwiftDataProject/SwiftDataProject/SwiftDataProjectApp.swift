//
//  SwiftDataProjectApp.swift
//  SwiftDataProject
//
//  Created by C3PO MBP on 13/12/24.
//

import SwiftData
import SwiftUI

@main
struct SwiftDataProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
