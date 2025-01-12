//
//  ContentView.swift
//  Flashzilla
//
//  Created by C3PO MBP on 11/01/25.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.accessibilityReduceMotion) var accessibilityReduceMotion
    @State private var scale = 1.0
    
    var body: some View {
        Button("Hello, world!") {
            if accessibilityReduceMotion {
                scale *= 1.5
            } else {
                withAnimation {
                    scale *= 1.5
                }
            }
        }
        .scaleEffect(scale)
    }
}

#Preview {
    ContentView()
}
