//
//  AddView.swift
//  iExpense
//
//  Created by C3PO MBP on 23/11/24.
//

import SwiftData
import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    
    @State private var name = "Expense Name"
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    var expenses: [ExpenseItem]
    
    let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Picker("Type", selection: $type) {
                        ForEach(types, id: \.self) {
                            Text($0)
                        }
                    }
                    
                    TextField("Amount", value: $amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                }
                
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
            .navigationTitle($name)
            .toolbar {
                Button("Save") {
                    let item = ExpenseItem(name: name, type: type, amount: amount)
                    
                    modelContext.insert(item)
                    dismiss()
                }
            }
            .navigationBarBackButtonHidden()
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: ExpenseItem.self, configurations: config)
        let sampleExpense = ExpenseItem(id: UUID(), name: "lunch", type: "Personal", amount: 20)
        
        return AddView(expenses: [sampleExpense])
            .modelContainer(container)
    } catch {
        return Text("Failed to load container: \(error.localizedDescription)")
    }
}
