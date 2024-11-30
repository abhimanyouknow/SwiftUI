//
//  ContentView.swift
//  Navigation
//
//  Created by C3PO MBP on 29/11/24.
//

import SwiftUI

struct ContentView: View {
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Button("Number 556") {
                    path.append(556)
                }
                
                Button("String Hello") {
                    path.append("Hello")
                }
            }
            .navigationDestination(for: Int.self) { selection in
                Text("You selected the number: \(selection)")
            }
            .navigationDestination(for: String.self) { selection in
                Text("You selected the string: \(selection)")
            }
        }
    }
}

#Preview {
    ContentView()
}
