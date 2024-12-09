//
//  ContentView.swift
//  Bookworm
//
//  Created by C3PO MBP on 09/12/24.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("notes") private var notes = ""
    
    var body: some View {
        NavigationStack {
            TextField("Enter your text", text: $notes, axis: .vertical)
                .textFieldStyle(.roundedBorder)
                    // to see the borders of the text field
                .navigationTitle("Notes")
                .padding()
        }
    }
}

#Preview {
    ContentView()
}
