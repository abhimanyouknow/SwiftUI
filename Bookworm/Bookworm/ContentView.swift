//
//  ContentView.swift
//  Bookworm
//
//  Created by C3PO MBP on 09/12/24.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("notes") private var notes = ""
        /* @AppStorage is basically using UserDefaults for
         storing simple things, but this should NOT be used
         to store secure information (usernames, passwords,
         etc.) */
    
    var body: some View {
        NavigationStack {
            TextEditor(text: $notes)
                .navigationTitle("Notes")
                .padding()
        }
    }
}

#Preview {
    ContentView()
}
