//
//  ContentView.swift
//  iExpense
//
//  Created by C3PO MBP on 22/11/24.
//

import SwiftUI

struct ExpenseItem: Identifiable, Codable {
    /* ExpenseItem conforming to Identifiable protocol signals
     that ExpenseItem data can be identified uniquely, somehow.
     
     This has only one requirement, there must be a property
     called 'id', with some unique identifier - could be a String,
     Int or even a UUID
     
     As a result of this, we don't have to specify the id
     parameter in the ForEach loop below */
    var id = UUID() // this generated a new unique id for each instance
    let name: String
    let type: String
    let amount: Double
}

@Observable
class Expenses {
    var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    /* creating custom initializer to load data from UserDefaults
     whenever user re-launches app */
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                /* [ExpenseItem].self is used to signal that
                 we're refering to the type, i.e., an array of
                 ExpenseItem */
                items = decodedItems
                return
            }
        }
        
        items = []
    }
}

struct ContentView: View {
    @State private var expenses = Expenses()
    
    @State private var showingAddExpenses = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        VStack {
                            Text(item.name)
                                .font(.headline)
                            
                            Text(item.type)
                        }
                        
                        Spacer()
                        
                        Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add Expense", systemImage: "plus") {
                    showingAddExpenses = true
                }
            }
            .sheet(isPresented: $showingAddExpenses) {
                AddView(expenses: expenses) /* sharing the same
                                             observable object
                                             class between the
                                             two views */
            }
        }
    }
    
    func removeItems(at offset: IndexSet) {
        expenses.items.remove(atOffsets: offset)
    }
}

#Preview {
    ContentView()
}
