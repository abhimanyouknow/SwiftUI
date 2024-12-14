//
//  UsersView.swift
//  SwiftDataProject
//
//  Created by C3PO MBP on 14/12/24.
//

/*
 this view is used to show the list of all users by default.
 we will pass a value to this view's initializer from the
 ContentView, which will then create custom sorting &
 filtering Queries
 */

import SwiftData
import SwiftUI

struct UsersView: View {
    @Query var users: [User]
    
    var body: some View {
        List(users) { user in
            Text(user.name)
        }
    }
    
    init(minimumJoinDate: Date, sortOrder: [SortDescriptor<User>]) {
        /* here, we're not making a new array, but rather a
         query that makes the array of that object */
        _users = Query(filter: #Predicate<User> { user in
            user.joinDate >= minimumJoinDate
        }, sort: sortOrder)
    }
}

#Preview {
    UsersView(minimumJoinDate: .now, sortOrder: [SortDescriptor(\User.name)])
        .modelContainer(for: User.self)
}
