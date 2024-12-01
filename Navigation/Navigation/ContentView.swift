//
//  ContentView.swift
//  Navigation
//
//  Created by C3PO MBP on 29/11/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            Text("Hello, world!")
                .toolbar {
                    ToolbarItemGroup(placement: .topBarLeading) {
                        Button("Tap Me") {
                            // button action code
                        }
                    
                        Button("Or Tap Me") {
                            // button action code
                        }
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
