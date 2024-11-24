//
//  AddView.swift
//  iExpense
//
//  Created by C3PO MBP on 23/11/24.
//

// this is the second view

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
        /* environment property used to manuall dismiss the second
         view and return to the main content view */
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    var expenses: Expenses
        /* property refering to the same Expenses class instance
         as the main content view */
    
    let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Amount", value: $amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button("Save") {
                    /* adding the expense details into the list on
                     the main content view by appending the new
                     ExpenseItem instance into the shared expenses
                     class instance */
                    let item = ExpenseItem(name: name, type: type, amount: amount)
                    expenses.items.append(item)
                    
                    // dismissing this view
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    // adding parameters which we are passing between the two views
    AddView(expenses: Expenses())
}
