//
//  ContentView.swift
//  HotProspects
//
//  Created by C3PO MBP on 04/01/25.
//

import SwiftUI

struct ContentView: View {
    @State private var backgroundColor = Color.red
    
    var body: some View {
        VStack {
            Text("Hello, world!")
                .padding()
                .foregroundStyle(.white)
                .background(backgroundColor)
            
            Text("Change color")
                .padding()
                .contextMenu {
                    Button("Red", systemImage: "circle") {
                        backgroundColor = .red
                    }
                    
                    Button("Green", systemImage: "square") {
                        backgroundColor = .green
                    }
                    
                    Button("Blue", systemImage: "triangle") {
                        backgroundColor = .blue
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
