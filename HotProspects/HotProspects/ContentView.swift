//
//  ContentView.swift
//  HotProspects
//
//  Created by C3PO MBP on 04/01/25.
//

import SwiftUI

struct ContentView: View {
    // step 1 - @State property to track the tab that's currently showing
    @State private var selectedTab = "One"
    
    var body: some View {
        // step 3 - pass that as a binding into the TabView so that it is tracked automatically
        TabView(selection: $selectedTab) {
            Button("Show Tab 2") {
                // step 2 - modify the property to a new value when you want to change tabs
                selectedTab = "Two"
            }
            .tabItem {
                Label("One", systemImage: "star")
            }
            // step 4 - tell SwiftUI which tab is to be shown for each value of that property
            .tag("One")
            
            Text("Tab 2")
                .tabItem {
                    Label("Two", systemImage: "circle")
                }
                .tag("Two")
        }
    }
}

#Preview {
    ContentView()
}
