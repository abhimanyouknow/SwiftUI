//
//  ContentView.swift
//  Navigation
//
//  Created by C3PO MBP on 29/11/24.
//

import SwiftUI

struct ContentView: View {
    @State private var title = "SwiftUI"
    
    var body: some View {
        NavigationStack {
            Text("Hello, world!")
                .navigationTitle($title)
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
