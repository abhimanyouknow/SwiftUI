//
//  ContentView.swift
//  WeSplit
//
//  Created by C3PO MBP on 02/11/24.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 15
    @FocusState private var amountIsFocused: Bool
    /* this FocusState property will be used to
     show/hide the keyboard after entering the amount */
    
    let tipPercentages = [0, 10, 15, 20, 25]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
            /* NOTE: we're adding 2 because this
             variable actually is equivalent of an
             index, and it starts from 2. This is why
             the default value in the picker for this is
             '4' people, corresponding to the value 2 */
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount * tipSelection / 100
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        /* NOTE: this view modifier
                         forces the decimal pad keyboard
                         instead of the regular text
                         keyboard */
                        .focused($amountIsFocused)
                        /* NOTE: this view modifier sets
                         the value of the property
                         amountIsFocused, which we use
                         to show/hide a 'Done' button to
                         close the keyboard */
                    
                    /* NOTE: we didn't use 'text:' as the
                     second parameter because
                     checkAmount is not a string, hence,
                     we used 'value:' */
                    
                    /* NOTE: the third parameter
                     'format' is used to format the
                     value */
                    
                    /* NOTE: Locale is a struct storing
                     all of the users' region settings.
                     We're using nil coalescing on the
                     users' Locale currency in case they
                     don't have one, we supply USD as
                     the default */
                    
                    Picker("Number of People", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                    .pickerStyle(.navigationLink)
                        /* NOTE: this view modifier turns
                         the picker into one which
                         navigates to a new view to
                         display and choose the options.
                         For this view to work, we
                         needed the form to be enclosed
                         within a NavigationStack */
                }
                
                Section("How much do you want to tip?") {
                    /* NOTE: The text in the parenthesis
                     is the Section Header */
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                        /* NOTE: this type of picker is
                         useful when we have a small
                         number of options to pick from
                         */
                }
                
//                Section {
//                    Picker("Tip Percentage", selection: $tipPercentage) {
//                        ForEach(0..<101) {
//                            Text($0, format: .percent)
//                        }
//                    }
//                    .pickerStyle(.navigationLink)
//                }
                
                Section("Total Amount") {
                    Text(totalPerPerson * Double(numberOfPeople + 2), format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .foregroundStyle(tipPercentage == 0 ? .red : .black) // project 3 - challenge 1
                }
                
                Section("Total Amount Per Person") {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                /* NOTE: this view modifier will add a
                 button with the text 'Done' if the
                 amount text field is focused. Tapping
                 the button will set the amountIsFocused
                 FocusState to false */
                if (amountIsFocused) {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
