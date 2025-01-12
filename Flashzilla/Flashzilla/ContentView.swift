//
//  ContentView.swift
//  Flashzilla
//
//  Created by C3PO MBP on 11/01/25.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.accessibilityDifferentiateWithoutColor) var accessibilityDifferentiateWithoutColor
    
    var body: some View {
        HStack {
            if accessibilityDifferentiateWithoutColor {
                Image(systemName: "checkmark.circle")
            }
            
            Text("Success")
        }
        .padding()
        .background(accessibilityDifferentiateWithoutColor ? .black : .green)
        .foregroundStyle(.white)
        .clipShape(.capsule)
    }
}

#Preview {
    ContentView()
}
