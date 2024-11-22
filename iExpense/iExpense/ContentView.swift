//
//  ContentView.swift
//  iExpense
//
//  Created by C3PO MBP on 22/11/24.
//

import SwiftUI

// this is the second view that we want to show
struct SecondView: View {
    @Environment(\.dismiss) var dismiss
        /* environment property to manually dismiss the second
         view */
    let name: String
    
    var body: some View {
        Text("Hello, \(name)!")
        Button("Dismiss") {
            dismiss() // calling the dismiss method
        }
    }
}

struct ContentView: View {
    /* step 1: adding a state property to track whether the
     sheet is showing or not */
    @State private var showingSheet = false
    
    var body: some View {
        
        // button which when pressed, shows the second view
        Button("Show Sheet") {
            // step 2: toggling the state when button is tapped
            showingSheet.toggle()
        }
        /* step 3: attaching the sheet somewhere in the current
         view hierarchy */
        .sheet(isPresented: $showingSheet) {
            // step 4: showing the contents of the sheet
            // invoking the second view
            SecondView(name: "Abhimanyu")
        }
    }
}

#Preview {
    ContentView()
}
