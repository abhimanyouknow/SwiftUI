//
//  DetailView.swift
//  Milestone4
//
//  Created by C3PO MBP on 17/12/24.
//

import SwiftUI

struct DetailView: View {
    let user: User
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text(user.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text(user.isActive ? "Active" : "Inactive")
                
                Text(String(user.age))
                    .font(.headline)
                
                Text(user.company)
                    .font(.headline)
                
                Text(user.email)
                    .font(.subheadline)
                    .foregroundColor(.blue)
                
                Text(user.address)
                    .font(.subheadline)
                
                Text("About:")
                    .font(.title2)
                    .padding(.top)
                Text(user.about)
                    .font(.body)
                
                Text(user.registered.ISO8601Format())
                
                Text("Tags")
                    .font(.title2)
                    .padding(.top)
                HStack {
                    ForEach(user.tags, id: \.self) { tag in
                        Text("#\(tag)")
                            .font(.caption)
                            .padding(5)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(5)
                    }
                }
                
                Text("Friends")
                    .font(.title2)
                    .padding(.top)
                ForEach(user.friends, id: \.self) { friend in
                    Text(friend.name)
                        .font(.body)
                        .padding(.leading, 10)
                }
            }
            .padding()
        }
    }
}

#Preview {
    DetailView(user: User(id: UUID(), isActive: true, name: "Test User", age: 24, company: "Gartner", email: "abc@test.com", address: "Old Trafford, Manchester", about: "Test is a die hard man utd fan", registered: Date.now, tags: ["ManUtd", "Manchester United"], friends: [Friend(id: UUID(), name: "Wayne Rooney")]))
}
