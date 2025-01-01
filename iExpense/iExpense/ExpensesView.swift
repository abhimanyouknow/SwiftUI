//
//  ExpensesView.swift
//  iExpense
//
//  Created by C3PO MBP on 15/12/24.
//

import SwiftData
import SwiftUI

struct ExpensesView: View {
    @Environment(\.modelContext) var modelContext
    @Query var expenses: [ExpenseItem]
    
    init(filterOption: String, sortOrder: [SortDescriptor<ExpenseItem>]) {
        _expenses = Query(filter: #Predicate<ExpenseItem> { expense in
            if filterOption != "All" {
                return expense.type == filterOption
            } else {
                return expense.type == "Personal" || expense.type == "Business"
            }
        }, sort: sortOrder)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            List {
                ForEach(expenses) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            
                            Text(item.type)
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                        
                        Spacer()
                        
                        Text(item.amount, format:
                            .currency(code: Locale.current.currency?.identifier ?? "USD"))
                            .foregroundStyle(item.amount < 10.0 ? .green : item.amount < 100.0 ? .blue : .red)
                    }
                    // project 15 - challenge 2
                    .accessibilityElement()
                    .accessibilityLabel("\(item.name) is an expense of \(item.amount)")
                    .accessibilityHint("Expense type: \(item.type)")
                }
                .onDelete(perform: removeExpense)
            }
            .listStyle(.inset)
        }
    }
    
    func removeExpense(at offsets: IndexSet) {
        for offset in offsets {
            let expense = expenses[offset]
            modelContext.delete(expense)
        }
    }
}

#Preview {
    ExpensesView(filterOption: "All", sortOrder: [SortDescriptor(\ExpenseItem.name)])
}
