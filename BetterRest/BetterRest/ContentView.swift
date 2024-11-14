//
//  ContentView.swift
//  BetterRest
//
//  Created by C3PO MBP on 12/11/24.
//

import CoreML // importing Swift's CoreML library
import SwiftUI

struct ContentView: View {
    // properties needed for ML model
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    /* NOTE: because they don't reference a specific instance,
     we can reference static properties inside initializers
     for regular properties */
    // computed property for default wake time to be 7AM
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }
    
    // removing these properties as part of challenge 3
//    // properties for alert which shows result
//    @State private var showingAlert = false
//    @State private var alertTitle = ""
//    @State private var alertMessage = ""
    
    var body: some View {
        NavigationStack {
            Form {
                // challenge 1: changing VStack to Section
                // user input for desired wake up time
                Section("When do you want to wake up?") {
                    DatePicker("Please select a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
                
                VStack(alignment: .leading, spacing: 0) {
                    // user input for desired sleep amount
                    Text("Desired amount of sleep")
                        .font(.headline)
                    
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                }
                
                // removing VStack as part of challenge 2
//                VStack(alignment: .leading, spacing: 0) {
//                    // user input for coffee consumption quantity
//                    Text("Daily coffee intake")
//                        .font(.headline)
//                    
//                    Stepper("^[\(coffeeAmount) cup](inflect: true)", value: $coffeeAmount, in: 1...20)
//                    /* NOTE: ^[](inflect: true) is a special
//                     syntax derived from markdown. here, it
//                     tells SwiftUI that the word 'cup' needs
//                     to be inflected (pluralised) based on the
//                     value of the 'coffeeAmount' variable
//                     value */
                
                // challenge 2: replacing stepper with picker
                Picker("Daily coffee intake", selection: $coffeeAmount) {
                    ForEach(1..<21) {
                        Text("\($0)")
                    }
                }
                //}
                
                /* challenge 3: displaying recommended wake up
                 time always - removing calculate button */
                Section("Your ideal sleep time is") {
                    Text(calculateBedtime())
                        .font(.largeTitle)
                }
            }
            .navigationTitle("BetterRest")
            // removing this as part of challenge 3
            // adding calculate button in the toolbar up top
//            .toolbar {
//                Button("Calculate", action: calculateBedtime)
//            }
//            .alert(alertTitle, isPresented: $showingAlert) {
//                Button("Ok") { }
//            } message: {
//                Text(alertMessage)
//            }
        }
    }
    
    // method to calculate bed time based on user inputs
    // altering method as part of challenge 2 and 3
    func calculateBedtime() -> String {
        var result = ""
        /* using CoreML could throw errors, hence we'll use a
         do-try-catch block */
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            /* the wakeUp property gives data of type Date
             which contains a lot of things, but we onlt want
             hours & minutes, that too in seconds, and pass it
             as a double type into our model */
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            /* get hours & minutes from wakeUp and convert
             them into seconds */
            let hours = (components.hour ?? 0) * 60 * 60
            let minutes = (components.minute ?? 0) * 60
            
            /* getting the prediction value from user inputs,
             which is essentially how much sleep the user
             actually needs */
            //let prediction = try model.prediction(wake: Double(hours + minutes), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            let prediction = try model.prediction(wake: Double(hours + minutes), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount + 1))
                /* NOTE: as part of challenge 2, we changed the
                 coffee intake to be a picker instead of a
                 stepper. since the binded value in the picker
                 refers to the index, we are adding 1 to
                 the binded value to get the number of coffee
                 cups consumed per day */
            
            /* but this value will be in seconds. we have to
             convert it to something meaningful. thanks to
             apple's APIs, we can subtract seconds from a Date
             type */
            let sleepTime = wakeUp - prediction.actualSleep
            
//            alertTitle = "Your ideal sleep time is..."
//            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
            
            result = sleepTime.formatted(date: .omitted, time: .shortened)
        } catch {
//            alertTitle = "Error"
//            alertMessage = "Sorry! There was a problem calculating your bedtime"
            result = "Oops! There was an error."
        }
        
        /* regardless of whether the predcition worked or not,
         we'll show the alert */
        //showingAlert = true
        
        return result
    }
}

#Preview {
    ContentView()
}
