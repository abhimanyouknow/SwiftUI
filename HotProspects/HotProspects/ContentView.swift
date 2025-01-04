//
//  ContentView.swift
//  HotProspects
//
//  Created by C3PO MBP on 04/01/25.
//

import SwiftUI

struct ContentView: View {
    let users = ["Tohru", "Yuki", "Kyo", "Momiji"]
    
    /* step 1 - make a state property to store whatever was tapped, this
     will be an optional string in our case because nothing is selected
     by default */
    @State private var selection: String?
    
    var body: some View {
        // step 2 - tell our list to update selection when a row is tapped
        List(users, id: \.self, selection: $selection) { user in
            Text(user)
        }
        
        // step 3 - use the selection somehow
        if let selection {
            Text("You selected: \(selection)")
        }
    }
}

#Preview {
    ContentView()
}
