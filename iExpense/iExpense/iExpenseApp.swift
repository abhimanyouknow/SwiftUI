//
//  iExpenseApp.swift
//  iExpense
//
//  Created by C3PO MBP on 22/11/24.
//

import SwiftData
import SwiftUI

@main
struct iExpenseApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: ExpenseItem.self)
    }
}
