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
            VStack {
                Form {
                    TextField("Name", text: $name)
                    
                    Picker("Type", selection: $type) {
                        ForEach(types, id: \.self) {
                            Text($0)
                        }
                    }
                    
                    TextField("Amount", value: $amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                    /* challenge 1 - part 1: using user's
                     default currency preference instead
                     of USD */
                }
                
                // project 9 - challenge 1 - part 4
                // adding cancel button which dismisses the view
                Button() {
                    dismiss()
                } label: {
                    Text("Cancel")
                        .font(.headline)
                        .foregroundStyle(.red)
                }
                .padding()
                .frame(width: 300, height: 50)
                .overlay(
                    Capsule()
                        .stroke(.red)
                )
                .clipShape(.capsule)
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
            // project 9 - challenge 1 - part 5
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    // adding parameters which we are passing between the two views
    AddView(expenses: Expenses())
}
