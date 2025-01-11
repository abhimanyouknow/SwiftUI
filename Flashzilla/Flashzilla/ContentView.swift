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
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
                .onTapGesture(count: 2) {
                    print("Double tapped")
                }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
