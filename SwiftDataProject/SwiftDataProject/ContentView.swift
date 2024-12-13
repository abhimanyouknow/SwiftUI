//
//  ContentView.swift
//  SwiftDataProject
//
//  Created by C3PO MBP on 13/12/24.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query(filter: #Predicate<User> { user in
        if user.name.localizedStandardContains("R") {
            if user.city == "London" {
                return true
            } else {
                return false
            }
        } else {
            return false
        }
        /* the above block could have also been written as -
         
         user.name.localizedStandardContains("R") &&
         user.city == "London"
         */
    }, sort: \User.name) var users: [User]
    
    var body: some View {
        NavigationStack {
            List(users) { user in
                Text(user.name)
            }
            .navigationTitle("Users")
            .toolbar {
                Button("Add Samples", systemImage: "plus") {
                    // deleting all existing User objects
                    try? modelContext.delete(model: User.self)
                    
                    let first = User(name: "Ed Sheeran", city: "London", joinDate: .now.addingTimeInterval(86400 * -10))
                    
                    let second = User(name: "Rosa Diaz", city: "New York", joinDate: .now.addingTimeInterval(86400 * -5))
                    
                    let third = User(name: "Roy Kent", city: "London", joinDate: .now.addingTimeInterval(86400 * 5))
                    
                    let fourth = User(name: "Johnny English", city: "London", joinDate: .now.addingTimeInterval(86400 * 10))
                    
                    modelContext.insert(first)
                    modelContext.insert(second)
                    modelContext.insert(third)
                    modelContext.insert(fourth)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
