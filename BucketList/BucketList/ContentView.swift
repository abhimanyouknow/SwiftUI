//
//  ContentView.swift
//  BucketList
//
//  Created by C3PO MBP on 24/12/24.
//

import SwiftUI

// step 1: add Comparable protocol to the User struct
struct User: Comparable, Identifiable {
    let id = UUID()
    var firstName: String
    var lastName: String
    
    // step 2: add method "<" for comparison (Operator Overloading)
    static func <(lhs: User, rhs: User) -> Bool {
        lhs.lastName < rhs.lastName
    }
}

struct ContentView: View {
    let users = [
        User(firstName: "Wayne", lastName: "Rooney"),
        User(firstName: "Robin", lastName: "van Persie"),
        User(firstName: "Rio", lastName: "Ferdinand")
    ].sorted()
        /* since we used operator overloaing for the
         less-than operator (<), we can directly call the
         .sorted() function */
    
    var body: some View {
        List(users) { user in
            Text("\(user.lastName), \(user.firstName)")
        }
    }
}

#Preview {
    ContentView()
}
