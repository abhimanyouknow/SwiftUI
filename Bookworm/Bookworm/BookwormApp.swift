//
//  BookwormApp.swift
//  Bookworm
//
//  Created by C3PO MBP on 09/12/24.
//

import SwiftData
import SwiftUI

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
