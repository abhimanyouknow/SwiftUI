//
//  ContentView.swift
//  Flashzilla
//
//  Created by C3PO MBP on 11/01/25.
//

import SwiftUI

struct ContentView: View {
    @State private var currentAmount = 0.0
    @State private var finalAmount = 1.0
    
    var body: some View {
        VStack {
            Text("Hello, world!")
                .scaleEffect(finalAmount + currentAmount)
                .gesture(
                    MagnifyGesture()
                        .onChanged { value in
                            currentAmount = value.magnification - 1
                        }
                        .onEnded { value in
                            finalAmount += currentAmount
                            currentAmount = 0
                        }
                )
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
