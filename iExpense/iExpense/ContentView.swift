//
//  ContentView.swift
//  iExpense
//
//  Created by C3PO MBP on 22/11/24.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    
    @State private var sortOrder = [
        SortDescriptor(\ExpenseItem.name),
        SortDescriptor(\ExpenseItem.amount)
    ]
    
    @State private var selectedFilter = "All"
        // 1 - all, 2 - personal, 3 - business
    @Query var expenses: [ExpenseItem]
        
    var body: some View {
        NavigationStack {
            ExpensesView(filterOption: selectedFilter, sortOrder: sortOrder)
            .padding()
            .navigationTitle("iExpense")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink("Add Expense") {
                        AddView(expenses: expenses)
                    }
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    Menu {
                        Menu("Sort") {
                            Picker("Sort", selection: $sortOrder) {
                                Text("Sort by Name")
                                    .tag([
                                        SortDescriptor(\ExpenseItem.name),
                                        SortDescriptor(\ExpenseItem.amount)
                                    ])
                                
                                Text("Sort by Amount")
                                    .tag([
                                        SortDescriptor(\ExpenseItem.amount),
                                        SortDescriptor(\ExpenseItem.name)
                                    ])
                            }
                        }
                        
                        Menu("Filter") {
                            Picker("Filter", selection: $selectedFilter) {
                                Text("All Expenses")
                                    .tag("All")
                                Text("Personal Expenses")
                                    .tag("Personal")
                                Text("Business Expenses")
                                    .tag("Business")
                            }
                        }
                    } label: {
                        Image(systemName: "line.3.horizontal.decrease.circle")
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
