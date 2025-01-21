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
    @State private var isShowingUser = false
    
    var body: some View {
        Button("Tap me") {
            selectedUser = User()
            isShowingUser = true
        }
        .alert("Welcome", isPresented: $isShowingUser, presenting: selectedUser) { user in
            Button(user.id) { }
        }
    }
}

#Preview {
    ContentView()
}
