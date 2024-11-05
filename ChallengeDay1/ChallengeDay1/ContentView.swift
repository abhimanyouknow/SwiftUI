//
//  ContentView.swift
//  ChallengeDay1
//
//  Created by C3PO MBP on 05/11/24.
//

import SwiftUI

struct ContentView: View {
    @State private var inputNumber = 0.0
    @State private var inputUnit = "Meters"
    @State private var outputUnit = "Miles"
    @FocusState private var isNumberFocused: Bool
    
    let conversionUnits = ["Meters", "Kilometers", "Feet", "Yards", "Miles"]
    
    
    var conversionMultiplier: Double {
        if inputUnit == "Meters" {
            if outputUnit == "Meters" { return 1.0 }
            else if outputUnit == "Kilometers" { return 0.001 }
            else if outputUnit == "Feet" { return 3.2808 }
            else if outputUnit == "Yards" { return 1.09361 }
            else if outputUnit == "Miles" { return 0.000621371 }
        } else if inputUnit == "Kilometers" {
            if outputUnit == "Meters" { return 1000 }
            else if outputUnit == "Kilometers" { return 1 }
            else if outputUnit == "Feet" { return 3280.84 }
            else if outputUnit == "Yards" { return 1093.61 }
            else if outputUnit == "Miles" { return 0.621371 }
        } else if inputUnit == "Feet" {
            if outputUnit == "Meters" { return 0.3048 }
            else if outputUnit == "Kilometers" { return 0.0003048 }
            else if outputUnit == "Feet" { return 1 }
            else if outputUnit == "Yards" { return 0.333333 }
            else if outputUnit == "Miles" { return 0.000189394 }
        } else if inputUnit == "Yards" {
            if outputUnit == "Meters" { return 0.9144 }
            else if outputUnit == "Kilometers" { return 0.0009144 }
            else if outputUnit == "Feet" { return 3 }
            else if outputUnit == "Yards" { return 1 }
            else if outputUnit == "Miles" { return 0.000568182 }
        } else if inputUnit == "Miles" {
            if outputUnit == "Meters" { return 1609.34 }
            else if outputUnit == "Kilometers" { return 1.60934 }
            else if outputUnit == "Feet" { return 5280 }
            else if outputUnit == "Yards" { return 1760 }
            else if outputUnit == "Miles" { return 1 }
        }
        
        return 0
    }
    
    var outputNumber: Double {
        inputNumber * conversionMultiplier
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Pick an input unit") {
                    // segmented control for input unit
                    Picker("Input Unit", selection: $inputUnit) {
                        ForEach(conversionUnits, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                }
                
                Section("Pick an output unit") {
                    // segmented control for output unit
                    Picker("Output Unit", selection: $outputUnit) {
                        ForEach(conversionUnits, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Enter value to be converted") {
                    // text field for input
                    TextField("Input", value:$inputNumber, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($isNumberFocused)
                    
                }
                
                Section("Converted Value") {
                    // text for output
                    Text(outputNumber, format: .number)
                }
            }
            .navigationTitle("Length Conversion")
            .toolbar {
                if isNumberFocused {
                    Button("Done") {
                        isNumberFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
