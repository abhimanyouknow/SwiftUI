//
//  ContentView.swift
//  SnowSeeker
//
//  Created by C3PO MBP on 21/01/25.
//

import SwiftUI

struct User: Identifiable {
    var id = "J. Cole"
}

struct ContentView: View {
    @State private var selectedUser: User? = nil
    
    var body: some View {
        Button("Tap me") {
            selectedUser = User()
        }
        .sheet(item: $selectedUser) { user in
            // 'user' is the unwrapped value when it exists
            Text(user.id)
        }
    }
}

#Preview {
    ContentView()
}
