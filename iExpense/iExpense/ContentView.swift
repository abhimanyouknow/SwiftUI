//
//  ContentView.swift
//  iExpense
//
//  Created by C3PO MBP on 22/11/24.
//

import SwiftUI

struct ContentView: View {
    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
        /* setting the value for the property from the
         UserDefaults corresponding to the key "Tap" */
    
    var body: some View {
        Button("Tap Count: \(tapCount)") {
            tapCount += 1
            
            UserDefaults.standard.set(tapCount, forKey: "Tap")
            /* storing the value of tapCount in UserDefaults
             against the key "Tap" */
        }
    }
}

#Preview {
    ContentView()
}
