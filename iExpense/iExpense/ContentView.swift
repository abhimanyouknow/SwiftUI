//
//  ContentView.swift
//  iExpense
//
//  Created by C3PO MBP on 22/11/24.
//

import SwiftUI

struct User: Codable {
    let firstName: String
    let lastName: String
}

struct ContentView: View {
    @State private var user = User(firstName: "Wayne", lastName: "Rooney")
    
    var body: some View {
        Button("Save User") {
            let encoder = JSONEncoder()
            
            if let userData = try? encoder.encode(user) {
                UserDefaults.standard.set(userData, forKey: "UserData")
            }
            
            // NOTE: the data type of userData is Data
        }
    }
}

#Preview {
    ContentView()
}
