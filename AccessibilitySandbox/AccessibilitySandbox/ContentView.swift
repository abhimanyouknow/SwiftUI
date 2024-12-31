//
//  ContentView.swift
//  AccessibilitySandbox
//
//  Created by C3PO MBP on 30/12/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button("John Fitzgerald Kennedy") {
            print("Button tapped")
        }
        .accessibilityInputLabels(["John Fitzgerald Kennedy", "John", "JFK"])
    }
}

#Preview {
    ContentView()
}
