//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by C3PO MBP on 05/12/24.
//

import SwiftUI

struct ContentView: View {
    @State private var counter = 0
    var body: some View {
        Button("Tap Count: \(counter)") {
            counter += 1
        }
        .sensoryFeedback(.impact(weight: .heavy, intensity: 1), trigger: counter)
    }
}

#Preview {
    ContentView()
}
