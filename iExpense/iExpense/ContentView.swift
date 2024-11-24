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
     parameter in the ForEach loop below
     
     Codable protocol is used for archiving & un-archiving data -
     this is useful when storing complex data using UserDefaults */
    var id = UUID() // this generates a new unique id for each instance
    let name: String
    let type: String
    let amount: Double
}

@Observable
class Expenses {
    var items = [ExpenseItem]() {
        didSet {
            /* encoding the array of ExpenseItems and storing
             the data with UserDefaults */
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
        
        /* setting items to a blank array if unable to un-archive
         and decode data from UserDefaults */
        items = []
    }
}

struct ContentView: View {
    @State private var expenses = Expenses()
        /* expenses is an instance of the Class Expenses. we're
         using a class so that we can use the data of this
         instance across views. to ensure that we keep a track of
         any changes to any properties within the class as opposed
         to this instance, we've used @Observable above the class
         definition */
    
    @State private var showingAddExpenses = false
        /* state property for tracking when to show/ hide the
         second view */
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            
                            Text(item.type)
                                .italic()
                                .font(.caption)
                        }
                        
                        Spacer()
                        
                        Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                            /* challenge 1 - part 1: using user's
                             default currency preference instead
                             of USD */
                        
                            /* challenge 2 : styling the amount
                             based on the different slabs */
                            .foregroundStyle(item.amount < 10.0 ? .green : item.amount < 100.0 ? .blue : .red)
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
                AddView(expenses: expenses)
                    /* showing the second view, while also sharing
                     the same observable object class between the
                     two views */
            }
        }
    }
    
    
    // method to delete items from the list
    func removeItems(at offset: IndexSet) {
        expenses.items.remove(atOffsets: offset)
    }
}

#Preview {
    ContentView()
}
