//
//  ContentView.swift
//  HotProspects
//
//  Created by C3PO MBP on 04/01/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Text("Tab 1")
                .tabItem {
                    Label("One", systemImage: "star")
                }
            
            Text("Tab 2")
                .tabItem {
                    Label("Two", systemImage: "circle")
                }
        }
    }
}

#Preview {
    ContentView()
}
