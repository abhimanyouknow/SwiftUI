//
//  ContentView.swift
//  Milestone4
//
//  Created by C3PO MBP on 17/12/24.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var users: [User]
    
    var body: some View {
        NavigationStack {
            List(users, id: \.id) { user in
                NavigationLink(destination: DetailView(user: user)) {
                    VStack(alignment: .leading) {
                        Text(user.name)
                            .font(.headline)
                        
                        HStack {
                            Text(user.isActive ? "Active" : "Inactive")
                            
                            Spacer()
                            
                            Text(user.registered, style: .date)
                        }
                    }
                }
            }
            .navigationTitle("Users")
            .task {
                if users.count == 0 {
                    await loadData()
                }
            }
        }
    }
    
    func loadData() async {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            let decodedUsers = try decoder.decode([User].self, from: data)
                        
            await MainActor.run {
                for user in decodedUsers {
                    modelContext.insert(user)
                }
            }
        } catch {
            print("Invalid data: \(error.localizedDescription)")
        }
    }
}

#Preview {
    ContentView()
}
