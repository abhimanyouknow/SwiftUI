//
//  BookwormApp.swift
//  Bookworm
//
//  Created by C3PO MBP on 09/12/24.
//

/* step 2: loading data model (tells the SwiftData to prepare some actual, physical
 storage on an iPhone to save data to, which is where it'll read & write our Student
 object) */

import SwiftData // step 2 - part 1
import SwiftUI

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Student.self) // step 2 - part 2
        
        // step 3
        /* setting up model context - which lets us work with all our data in Memory
         (RAM). this is done automatically for us by the .modelContainer(for: ) modifier -
         called the main context & is stored inside the SwiftUI environment */
    }
}
