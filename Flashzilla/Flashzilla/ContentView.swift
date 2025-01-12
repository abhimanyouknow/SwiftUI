//
//  ContentView.swift
//  Flashzilla
//
//  Created by C3PO MBP on 11/01/25.
//

import SwiftUI

struct ContentView: View {
    // step 1 - new property to watch the environemnt value scenePhase
    @Environment(\.scenePhase) var scenePhase
    
    var body: some View {
        Text("Hello, world!")
            /* step 2 - using an .onChange() modifier to watch when the
             scenePhase is changing */
            .onChange(of: scenePhase) { oldPhase, newPhase in
                // step 3 - responding to that scenePhase somehow
                if newPhase == .active {
                    print("Active")
                } else if newPhase == .inactive {
                    print("Inactive")
                } else if newPhase == .background {
                    print("Background")
                }
            }
    }
}

#Preview {
    ContentView()
}
