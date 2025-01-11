//
//  ContentView.swift
//  Flashzilla
//
//  Created by C3PO MBP on 11/01/25.
//

import SwiftUI

struct ContentView: View {
    @State private var currentAmount = Angle.zero
    @State private var finalAmount = Angle.zero
    
    var body: some View {
        VStack {
            Text("Hello, world!")
                .rotationEffect(currentAmount + finalAmount)
                .gesture(
                    RotateGesture()
                        .onChanged { value in
                            currentAmount = value.rotation
                        }
                        .onEnded { value in
                            finalAmount += currentAmount
                            currentAmount = .zero
                        }
                )
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
