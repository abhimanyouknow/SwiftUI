//
//  ContentView.swift
//  Flashzilla
//
//  Created by C3PO MBP on 11/01/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, world!")
                .onLongPressGesture(minimumDuration: 2) {
                    print("Double tapped")
                } onPressingChanged: { inProgress in
                    print("In progress: \(inProgress)")
                }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
